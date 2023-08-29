Class {
	#name : #FASTTextHighlighter,
	#superclass : #Object,
	#instVars : [
		'attributeMapper'
	],
	#category : #'FAST-Core-Tools-Highlighter'
}

{ #category : #public }
FASTTextHighlighter >> addAttribute: aTextAttribute for: anEntity [ 
	| attributes |
	attributes := self attributeMapper at: anEntity ifAbsentPut: [ OrderedCollection new ].
	attributes add: aTextAttribute
]

{ #category : #accessing }
FASTTextHighlighter >> attributeMapper [ 
	"returns a dictionary with keys corresponding to parser names and 
	values corresponding to a collection of TextAttributes"
	^ attributeMapper
]

{ #category : #accessing }
FASTTextHighlighter >> attributeMapper: aDictionary [ 
	attributeMapper := aDictionary
]

{ #category : #public }
FASTTextHighlighter >> bold: anElementString [
	self addAttribute: TextEmphasis bold for: anElementString
]

{ #category : #public }
FASTTextHighlighter >> color: anElementString with: aColor [
	self addAttribute: (TextColor new color: aColor) for: anElementString
]

{ #category : #public }
FASTTextHighlighter >> highlight: anFASTEntity [
	| text |
	text := anFASTEntity sourceText asText.
	anFASTEntity allChildren
		do: [ :child | 
			(child startPos isNotNil and: child endPos isNotNil)
				ifTrue: [ attributeMapper at: child class ifPresent: [ :attributes | attributes do: [ :each | text addAttribute: each from: child startPos to: child endPos ] ] ] ].
	^ text
]

{ #category : #initialization }
FASTTextHighlighter >> initialize [
	super initialize.
	attributeMapper := Dictionary new
]
