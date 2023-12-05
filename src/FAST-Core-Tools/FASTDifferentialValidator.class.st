"
I help checking the completness of FAST meta-model

## Process

For this:
- I go through all source files in a file hierarchy
- I extract a FAST model for each source file
- I re-export the source code from the FAST model
- I extract a new FAST model from the new code, and
- finally I compare the 2 FAST models (they should be the same)

## Caveat

This is not full-proof
- Some ASTs can be different and the code be ""the same"" for example `a + b + c` usually has different AST from `a + (b + c)`
- properties of nodes are currently not tested, so `a==b` is considered equal to `a!=b` because the #operator is not tested

## Configuration

There is a setting strict/not-strict (not by default) that allows to accept some minor AST differences (see above)
For this, a suitable `acceptableAST:differentFrom:` method should be defined that will receive 2 differeing nodes (one in each AST) and  must decide whether the difference is acceptable

There is a `skipPaths` list to allow skiping some paths in the main file directory
"
Class {
	#name : #FASTDifferentialValidator,
	#superclass : #Object,
	#instVars : [
		'skipPaths',
		'comparator',
		'encoding'
	],
	#category : #'FAST-Core-Tools-Validator'
}

{ #category : #accessing }
FASTDifferentialValidator >> comparator [

	^comparator ifNil: [ comparator := self comparatorClass new ]
]

{ #category : #accessing }
FASTDifferentialValidator >> comparatorClass [

	^FamixModelComparator
]

{ #category : #running }
FASTDifferentialValidator >> compare: node1 to: node2 [
	
	self comparator compare: node1 to: node2
]

{ #category : #accessing }
FASTDifferentialValidator >> defaultEncoding [
	"other possibilities are 'latin1', 'utf8', ...
	see `ZnCharacterEncoder knownEncodingIdentifiers` for all possibilities"
	^encoding ifNil: [ 'iso-8859-1' ]
]

{ #category : #accessing }
FASTDifferentialValidator >> encoding [

	^encoding
]

{ #category : #accessing }
FASTDifferentialValidator >> encoding: aString [

	encoding := aString
]

{ #category : #utilities }
FASTDifferentialValidator >> getASTFromFileReference: aFileReference [

	| model |
	aFileReference readStreamEncoded: self defaultEncoding do: [ :stream |
		model := self getASTFromString: stream contents ].

	^self getTopLevelNodes: model
]

{ #category : #utilities }
FASTDifferentialValidator >> getASTFromString: stream [

	self subclassResponsibility  
]

{ #category : #utilities }
FASTDifferentialValidator >> getRootNode: aModel [

	^aModel detect: [ : e | e allParents isEmpty ]
]

{ #category : #utilities }
FASTDifferentialValidator >> getTopLevelNodes: model [

	self subclassResponsibility
]

{ #category : #initialization }
FASTDifferentialValidator >> initialize [

	super initialize.

	skipPaths := #().
]

{ #category : #testing }
FASTDifferentialValidator >> isSourceFile: aFileReference [

	self subclassResponsibility 
]

{ #category : #'instance creation' }
FASTDifferentialValidator >> on: aDirectoryName [

	self runOnFileReference: aDirectoryName asFileReference
]

{ #category : #utilities }
FASTDifferentialValidator >> reExportAST: ast [

	self subclassResponsibility
]

{ #category : #running }
FASTDifferentialValidator >> runOnDirectory: aDirectory [

	aDirectory isDirectory
		ifFalse: [ Exception signal: aDirectory fullName , ' not a directory' ].

	aDirectory children do: [ :fileRef | self runOnFileReference: fileRef ]
]

{ #category : #running }
FASTDifferentialValidator >> runOnFileReference: aFileReference [

	(self skipPaths includes: aFileReference fullName)
		ifTrue: [ ^self ].

	aFileReference isDirectory
		ifTrue: [ ^self runOnDirectory: aFileReference ].

	(self isSourceFile: aFileReference)
		ifTrue: [ ^self runOnSourceFile: aFileReference ].

]

{ #category : #running }
FASTDifferentialValidator >> runOnSourceFile: aFileReference [

	| astOrig astBis topLevelNodes |
	aFileReference fullName traceCr.

	topLevelNodes := self getASTFromFileReference: aFileReference.

	topLevelNodes ifNotEmpty: [
		
		astOrig := self getRootNode: topLevelNodes.
		astBis := self getRootNode:
			(self getASTFromString: (self reExportAST: astOrig)).
	
		self compare: astOrig to: astBis
	]
]

{ #category : #accessing }
FASTDifferentialValidator >> skipPaths [

	^ skipPaths
]

{ #category : #accessing }
FASTDifferentialValidator >> skipPaths: anObject [

	skipPaths := anObject
]
