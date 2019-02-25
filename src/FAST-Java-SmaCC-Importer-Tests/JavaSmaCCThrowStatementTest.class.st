Class {
	#name : #JavaSmaCCThrowStatementTest,
	#superclass : #JavaSmaCCImporterTest,
	#instVars : [
		'throwMethod'
	],
	#category : #'FAST-Java-SmaCC-Importer-Tests'
}

{ #category : #resources }
JavaSmaCCThrowStatementTest >> methodThrow [
	^ 
'boolean methodThrow() {
  if(true) { 
	throw new Error();
 }
}
'
]

{ #category : #running }
JavaSmaCCThrowStatementTest >> setUp [
	super setUp.
	throwMethod := (self parseMethod: 'throw') allFASTJavaMethodEntity first
]

{ #category : #tests }
JavaSmaCCThrowStatementTest >> testThrowStatementParent [
	self assert: (throwMethod mooseModel allWithType: FASTJavaThrowStatement) anyOne parentNode equals: throwMethod statements anyOne thenPart childrenNode anyOne
]

{ #category : #tests }
JavaSmaCCThrowStatementTest >> testThrowStatementParentAsChild [
	self assert: (throwMethod mooseModel allWithType: FASTJavaThrowStatement) anyOne equals: throwMethod statements anyOne thenPart childrenNode anyOne childrenNode anyOne
]

{ #category : #tests }
JavaSmaCCThrowStatementTest >> testThrowStatementSize [
	self assert: (throwMethod mooseModel allWithType: FASTJavaThrowStatement) size equals: 1 
]
