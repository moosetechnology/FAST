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
	#name : #FASTAbstractDifferentialValidator,
	#superclass : #FASTAbstractValidator,
	#instVars : [
		'comparator'
	],
	#category : #'FAST-Core-Tools-Validator'
}

{ #category : #accessing }
FASTAbstractDifferentialValidator >> comparator [

	^comparator ifNil: [ comparator := self comparatorClass new ]
]

{ #category : #accessing }
FASTAbstractDifferentialValidator >> comparatorClass [

	^FamixModelComparator
]

{ #category : #running }
FASTAbstractDifferentialValidator >> compare: node1 to: node2 [
	
	self comparator compare: node1 to: node2
]

{ #category : #utilities }
FASTAbstractDifferentialValidator >> getASTFromFileReference: aFileReference [

	^self getTopLevelNodes: (super getASTFromFileReference: aFileReference)
]

{ #category : #utilities }
FASTAbstractDifferentialValidator >> getRootNode: aModel [

	^aModel detect: [ : e | e allParents isEmpty ]
]

{ #category : #utilities }
FASTAbstractDifferentialValidator >> getTopLevelNodes: model [

	self subclassResponsibility
]

{ #category : #utilities }
FASTAbstractDifferentialValidator >> reExportAST: ast [

	self subclassResponsibility
]

{ #category : #running }
FASTAbstractDifferentialValidator >> runOnSourceFile: aFileReference [

	| astOrig astBis topLevelNodes |
	aFileReference fullName traceCr.

	topLevelNodes := [
		self getASTFromFileReference: aFileReference
	]
	on: Error
	do: [
		'  ** NOT PARSEABLE **' traceCr.
		"Note: If we cannot get the original AST, no use to try to regenerate it"
		#()
	].

	topLevelNodes ifNotEmpty: [
		
		astOrig := self getRootNode: topLevelNodes.
		astBis := self getRootNode:
			(self getASTFromString: (self reExportAST: astOrig)).
	
		self compare: astOrig to: astBis
	]
]
