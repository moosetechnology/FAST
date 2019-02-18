"
I represent a Java Unary Expression
	
It can be :

++i
i++
--i
i--
!b
+i
-i

see: https://docs.oracle.com/javase/tutorial/java/nutsandbolts/op1.html
"
Class {
	#name : #FASTJavaUnaryExpression,
	#superclass : #FASTExpression,
	#instVars : [
		'expression',
		'isPrefixedUnaryExpression',
		'operator'
	],
	#category : #'FAST-Core-Model-Entities'
}

{ #category : #meta }
FASTJavaUnaryExpression class >> annotation [

	<MSEClass: #JavaUnaryExpression super: #FASTExpression>
	<package: #'FAST-Core-Model'>
	<generated>
	^self
]

{ #category : #generator }
FASTJavaUnaryExpression class >> generatedSlotNames [
	<generated>
	'FASTJavaUnaryExpression class>>#generatedSlotNames'.
	^ #(expression isPrefixedUnaryExpression operator)
]

{ #category : #generator }
FASTJavaUnaryExpression class >> generatedTraitNames [
	<generated>
	^ #()
]

{ #category : #meta }
FASTJavaUnaryExpression class >> requirements [

	<generated>
	^ {  }
]

{ #category : #accessing }
FASTJavaUnaryExpression >> expression [

	<MSEProperty: #expression type: #FASTExpression>
	<generated>
	<MSEComment: 'The affected expression'>
	^ expression
]

{ #category : #accessing }
FASTJavaUnaryExpression >> expression: anObject [

	<generated>
	expression := anObject

]

{ #category : #accessing }
FASTJavaUnaryExpression >> isPrefixedUnaryExpression [

	<MSEProperty: #isPrefixedUnaryExpression type: #Boolean>
	<generated>
	<MSEComment: 'true if the expression is prefixed (ex. ++i) else false'>
	^ isPrefixedUnaryExpression
]

{ #category : #accessing }
FASTJavaUnaryExpression >> isPrefixedUnaryExpression: anObject [

	<generated>
	isPrefixedUnaryExpression := anObject

]

{ #category : #accessing }
FASTJavaUnaryExpression >> operator [

	<MSEProperty: #operator type: #String>
	<generated>
	<MSEComment: 'The operator string to apply to the expression'>
	^ operator
]

{ #category : #accessing }
FASTJavaUnaryExpression >> operator: anObject [

	<generated>
	operator := anObject

]
