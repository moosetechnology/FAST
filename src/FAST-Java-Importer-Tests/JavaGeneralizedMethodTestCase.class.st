Class {
	#name : #JavaGeneralizedMethodTestCase,
	#superclass : #JavaImporterTestCase,
	#category : #'FAST-Java-Importer-Tests'
}

{ #category : #running }
JavaGeneralizedMethodTestCase >> setUpMethods [
	aLittleOfVariables := self assembleFastMethodFromModelByName: 'aLittleOfVariables'.
	aLittleOfVariables2 := self assembleFastMethodFromModelByName: 'aLittleOfVariables2'.
	aLittleOfVariables3 := self assembleFastMethodFromModelByName: 'aLittleOfVariables3'.
	aLittleOfVariables4 := self assembleFastMethodFromModelByName: 'aLittleOfVariables4'.
	aLittleOfVariables5 := self assembleFastMethodFromModelByName: 'aLittleOfVariables5'.
	ifMethod := self assembleFastMethodFromModelByName: 'ifMethod'.
	params := self assembleFastMethodFromModelByName: 'params'.
	supersimple := self assembleFastMethodFromModelByName: 'supersimple'.
	whileWhile := self assembleFastMethodFromModelByName: 'whileWhile'.
	allMethods := {aLittleOfVariables.aLittleOfVariables2.aLittleOfVariables3.aLittleOfVariables4.aLittleOfVariables5.ifMethod.params.supersimple.whileWhile}
]

{ #category : #tests }
JavaGeneralizedMethodTestCase >> testMethodImport [
	allMethods do: [ :method | self assert: method notNil ]
]

{ #category : #tests }
JavaGeneralizedMethodTestCase >> testMethodType [
	allMethods do: [ :method | self assert: (method isMemberOf: FASTJavaMethodEntity) ]
]

{ #category : #tests }
JavaGeneralizedMethodTestCase >> testStatementsMethodReference [
	allMethods do: [ :method |
		self assert: (method statements allSatisfy: [ :statement | statement parentNode parentNode == method ]) ] 
]

{ #category : #tests }
JavaGeneralizedMethodTestCase >> testStatementsShortcut [
	allMethods do: [ :method |
		self assert: method statementBlock statements equals: method statements ]  
]
