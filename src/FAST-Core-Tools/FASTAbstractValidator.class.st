Class {
	#name : #FASTAbstractValidator,
	#superclass : #Object,
	#instVars : [
		'skipPaths',
		'encoding'
	],
	#category : #'FAST-Core-Tools-Validator'
}

{ #category : #accessing }
FASTAbstractValidator >> defaultEncoding [
	"other possibilities are 'latin1', 'utf8', ...
	see `ZnCharacterEncoder knownEncodingIdentifiers` for all possibilities"
	^encoding ifNil: [ 'iso-8859-1' ]
]

{ #category : #accessing }
FASTAbstractValidator >> encoding [

	^encoding
]

{ #category : #accessing }
FASTAbstractValidator >> encoding: aString [

	encoding := aString
]

{ #category : #utilities }
FASTAbstractValidator >> getASTFromFileReference: aFileReference [

	^aFileReference readStreamEncoded: self defaultEncoding do: [ :stream |
		self getASTFromString: stream contents ]

]

{ #category : #utilities }
FASTAbstractValidator >> getASTFromString: stream [

	self subclassResponsibility  
]

{ #category : #initialization }
FASTAbstractValidator >> initialize [

	super initialize.

	skipPaths := #().
]

{ #category : #testing }
FASTAbstractValidator >> isSourceFile: aFileReference [

	self subclassResponsibility 
]

{ #category : #'instance creation' }
FASTAbstractValidator >> on: aDirectoryName [

	self runOnFileReference: aDirectoryName asFileReference
]

{ #category : #running }
FASTAbstractValidator >> runOnDirectory: aDirectory [

	aDirectory isDirectory
		ifFalse: [ Exception signal: aDirectory fullName , ' not a directory' ].

	aDirectory children do: [ :fileRef | self runOnFileReference: fileRef ]
]

{ #category : #running }
FASTAbstractValidator >> runOnFileReference: aFileReference [

	(self skipPaths includes: aFileReference fullName)
		ifTrue: [ ^self ].

	aFileReference isDirectory
		ifTrue: [ ^self runOnDirectory: aFileReference ].

	(self isSourceFile: aFileReference)
		ifTrue: [ ^self runOnSourceFile: aFileReference ].

]

{ #category : #testing }
FASTAbstractValidator >> runOnSourceFile: aFileReference [

	self subclassResponsibility 
]

{ #category : #accessing }
FASTAbstractValidator >> skipPaths [

	^ skipPaths
]

{ #category : #accessing }
FASTAbstractValidator >> skipPaths: anObject [

	skipPaths := anObject
]
