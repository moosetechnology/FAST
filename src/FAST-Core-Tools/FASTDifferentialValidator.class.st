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
		'strict'
	],
	#category : #'FAST-Core-Tools'
}

{ #category : #utilities }
FASTDifferentialValidator >> acceptableAST: ast1 differentFrom: ast2 [
	"In non strict mode, some differences could be accepted"

	^false	
]

{ #category : #utilities }
FASTDifferentialValidator >> ast: ast1 differ: ast2 [

	self strict ifTrue:  [ Exception signal: 'ASTs differ' ].

	(self acceptableAST: ast1 differentFrom: ast2)
		ifTrue:  [
			('  ** difference in ignored, position in source: ' , ast1 startPos asString)
				traceCr.
			Notification signal
		]
		ifFalse: [ Exception signal: 'ASTs differ' ]
]

{ #category : #configuration }
FASTDifferentialValidator >> beStrict [

	self strict: true
]

{ #category : #utilities }
FASTDifferentialValidator >> childrenNodes: astNode [

	^OrderedCollection withAll:
		(astNode children sorted: [:a :b | a startPos <= b startPos])

]

{ #category : #utilities }
FASTDifferentialValidator >> compare: ast1 to: ast2 [
	"comparing the two lists of children may seem a bit complicate, but it is trying
	 to give more info on when the children starts to differ"

	| children1 children2 size1 size2 |

	(ast1 class = ast2 class)
		ifFalse: [ self ast: ast1 differ: ast2 ].

	children1 := self childrenNodes: ast1.
	children2 := self childrenNodes: ast2.

	size1 := children1 size.
	size2 := children2 size.

	1 to: size1 do: [ :i |
		(size2 < i)
			ifTrue: [ self ast: (children1 at: i) differ: nil ]
			ifFalse: [ self compare: (children1 at: i) to: (children2 at: i) ]
	].

	(children2 size > children1 size)
	ifTrue: [self ast: nil differ: (children2 at: (children1 size + 1)) ]
]

{ #category : #utilities }
FASTDifferentialValidator >> getASTFromFileReference: aFileReference [

	| model |
	aFileReference readStreamDo: [ :stream |
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

	strict := false.
	skipPaths := #()
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
	
		[self compare: astOrig to: astBis]
		on: Notification
		do: [ "continue" ]
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

{ #category : #accessing }
FASTDifferentialValidator >> strict [

	^ strict
]

{ #category : #accessing }
FASTDifferentialValidator >> strict: anObject [

	strict := anObject
]
