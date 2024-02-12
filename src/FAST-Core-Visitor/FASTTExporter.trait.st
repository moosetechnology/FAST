"
A trait with some default methods to export
It offers two features:
- handling the output stream and writing to it and indentation
- handling operators precedence and deciding when to put parenthesis around an expression
"
Trait {
	#name : #FASTTExporter,
	#instVars : [
		'operatorsPrecedence',
		'expressionContextOperator',
		'outputStream',
		'indentLevel'
	],
	#category : #'FAST-Core-Visitor'
}

{ #category : #outputting }
FASTTExporter >> << aPrintable [
	"syntactical sugar"

	self output: aPrintable
]

{ #category : #precedence }
FASTTExporter >> defaultOperatorsPrecedence [
	"operatorsPrecedence is a dictionary: operator -> precedence for all possible operators
	Higher number means higher precedence
	the same operator can be entered in different forms (eg: #add and #'+')
	
	The value here are examples but should be correct for many languages.
	They fit C/Java operators definition.
	The gaps in precedence values allow to introduce other operators if needed.
	And the precedences value can also be changed.

	The last one (#topLevelExpression) is introduced to deal with expressions within other expressions
	For example in `1 * someFunction(2 + 3)` , '*' has no precedence over '+', but because the check
	(see #lowerPrecedence:) uses a global expression stack, it could get confused.
	The solution is to push #topLevelExpression on the stack at the start of a new expression (here
	'2 + 3')"

	^{
		"unary postfix operators"
		#'unary++' -> 120 .
		#'unary--' -> 120 .

		"unary prefix operators
		 cannot be just the operator itself because '-' would be confused with the binary '-'"
		#'++unary' -> 110 .
		#'--unary' -> 110 .
		#'+unary' -> 110 .
		#'-unary' -> 110 .

		#'!' -> 110 .
		#'!unary' -> 110.
		#not -> 110 .
		
		"cast"
		#cast -> 100 .

		"multiplicative operators"
		#'*' -> 90 .
		#times -> 90 .
		#'/' -> 90 .
		#divide -> 90 .
		#'%' -> 90 .
		#mod -> 90 .
	
		"stringConcatenationOperator -- needed to deal with: String+(i+1)"
		#concat -> 80 .

		"additive operators"
		#'+' -> 70 .
		#add -> 70 .
		#'-' -> 70 .
		#minus -> 70 .

		"relational operators"
		#'<' -> 60 .
		#lt -> 60 .
		#lessThan -> 60 .

		#'>' -> 60 .
		#gt -> 60 .
		#greaterThan -> 60 .

		#'<=' -> 60 .
		#le -> 60 .
		#lessEqual -> 60 .

		#'>=' -> 60 .
		#ge -> 60 .
		#greaterEqual -> 60 .

		"equality operators"
		#'==' -> 50 .
		#eq -> 50 .
		#equal -> 50 .

		#'!=' -> 50 .
		#ne -> 50 .
		#notEqual -> 50 .

		"logical And operators"
		#'&&' -> 40 .
		#and -> 40 .

		"logical Or operators"
		#'||' -> 30 .
		#or -> 30 .

		"ternary operator"
		#'?:' -> 20 .

		"assignment operators"
		#'=' ->  10 .
		#'+=' -> 10 .
		#'-=' -> 10 .
		#'*=' -> 10 .
		#'/=' -> 10 .

		#topLevelExpression -> 0
	}
]

{ #category : #precedence }
FASTTExporter >> expressionContextOperator [
	"lazy accessor"

	^expressionContextOperator ifNil: [ expressionContextOperator := Stack new ].

]

{ #category : #outputting }
FASTTExporter >> indent [

	^indentLevel := self indentLevel + 1
]

{ #category : #accessing }
FASTTExporter >> indentLevel [

	^ indentLevel ifNil: [ indentLevel := 0 ]
]

{ #category : #outputting }
FASTTExporter >> indented: aPrintable [

	self outputIndentPrefix.
	self unindented: aPrintable
]

{ #category : #precedence }
FASTTExporter >> languageOperatorsPrecedence [
	"this methods gives a chance to redefine precedence in different languages

	specific language exporters should redefine it and make changes to the #operatorsPrecedence Dictionary"

]

{ #category : #precedence }
FASTTExporter >> lowerPrecedence: operator [
	"check whether #operator has lower precedence than a surounding expression (top of
	expressionContextOperator)
	If so, the current expression will need to be parenthesized"

	^self expressionContextOperator
		ifEmpty: [ false ]
		ifNotEmpty: [ :operatorStack |
			(self operatorPrecedence: operator) < (self operatorPrecedence: operatorStack top)]
]

{ #category : #outputting }
FASTTExporter >> newLine [

	self outputStream cr
]

{ #category : #precedence }
FASTTExporter >> operatorPrecedence: operator [

	^self operatorsPrecedence at: operator asSymbol
]

{ #category : #precedence }
FASTTExporter >> operatorsPrecedence [
	"lazy accessor"

	^operatorsPrecedence ifNil: [
			operatorsPrecedence := Dictionary newFrom: self defaultOperatorsPrecedence.
			self languageOperatorsPrecedence.
			operatorsPrecedence ]
]

{ #category : #outputting }
FASTTExporter >> output: aPrintable [

	self outputStream << aPrintable
]

{ #category : #precedence }
FASTTExporter >> outputExpression: aBlock inParentheses: aBoolean [
	"executes aBlock to output some expression, putting it within parenthesis if needed"

	aBoolean ifTrue: [ self output: '(' ].
	aBlock value.
	aBoolean ifTrue: [ self output: ')' ]
]

{ #category : #precedence }
FASTTExporter >> outputExpression: aBlock withOperator: operator [
	"execute aBlock possibly putting parenthesis around the result depending on the precedence of #operator
	 But before executing a block, we need to push the operator on the context stack so that 
	 precedence of possible sub-expressions be compared to it"

	self
		outputExpression: [
			self expressionContextOperator push: operator.
			aBlock value.
			self expressionContextOperator pop
		]
		 inParentheses: (self lowerPrecedence: operator)
]

{ #category : #outputting }
FASTTExporter >> outputIndentPrefix [
	"prints indentation spaces"

	self spaces: (self indentLevel * 2)
	
]

{ #category : #outputting }
FASTTExporter >> outputStream [
	"lazy accessor"

	^outputStream ifNil: [ outputStream := WriteStream on: '' ]
]

{ #category : #precedence }
FASTTExporter >> outputTopLevelExpression: aBlock [
	"Execute aBlock to output an expression.
	 Puts special symbol on the expressionContextOperator stack to indicate the start of a
	 new expression

	See comment in #initializeOperatorsPrecedence"

	self expressionContextOperator push: #topLevelExpression.
	aBlock value.
	self expressionContextOperator pop
]

{ #category : #outputting }
FASTTExporter >> space [

	self output: String space
]

{ #category : #outputting }
FASTTExporter >> spaces: n [

	n timesRepeat: [ self space ]
]

{ #category : #outputting }
FASTTExporter >> unindent [

	(self indentLevel <= 0) ifTrue: [ ^indentLevel := 0 ].
	^indentLevel := self indentLevel - 1
]

{ #category : #outputting }
FASTTExporter >> unindented: aPrintable [

	self output: aPrintable
]
