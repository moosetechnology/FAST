Class {
	#name : #JavaSmaCCFieldDeclarationTest,
	#superclass : #JavaSmaCCImporterTest,
	#instVars : [
		'fieldDeclaration'
	],
	#category : #'FAST-Java-SmaCC-Importer-Tests'
}

{ #category : #resources }
JavaSmaCCFieldDeclarationTest >> methodFieldDeclaration [
	
	^ 'String fieldDeclaration() {
		Patate p = new Patate() { 
			int i = 3, j;
		};
	}'
]

{ #category : #running }
JavaSmaCCFieldDeclarationTest >> setUp [
	super setUp.
	fieldDeclaration := (self parseMethod: 'fieldDeclaration') allFASTJavaMethodEntity
		first
]

{ #category : #tests }
JavaSmaCCFieldDeclarationTest >> testFieldDeclarationParent [
	self
		assert: fieldDeclaration statements first declarators first expression parentNode
		equals: fieldDeclaration statements first declarators first
]

{ #category : #tests }
JavaSmaCCFieldDeclarationTest >> testFieldDeclarationSize [
	"2 with Patate p"
	self assert: (fieldDeclaration mooseModel allWithType: FASTJavaVarDeclStatement) size equals: 2.
	"3 with Patate p"
	self assert: (fieldDeclaration mooseModel allWithType: FASTJavaVariableDeclarator) size equals: 3.
	
]
