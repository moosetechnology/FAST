Class {
	#name : #JavaSmaCCGeneralizedMethodTestCase,
	#superclass : #JavaSmaCCImporterTestCase,
	#category : #'FAST-Java-SmaCC-Importer-Tests'
}

{ #category : #running }
JavaSmaCCGeneralizedMethodTestCase >> setUpMethods [
	aLittleOfVariables := self assembleFastMethodFromModelByName: 'aLittleOfVariables'.
	aLittleOfVariables2 := self assembleFastMethodFromModelByName: 'aLittleOfVariables2'.
	aLittleOfVariables3 := self assembleFastMethodFromModelByName: 'aLittleOfVariables3'.
	aLittleOfVariables4 := self assembleFastMethodFromModelByName: 'aLittleOfVariables4'.
	aLittleOfVariables5 := self assembleFastMethodFromModelByName: 'aLittleOfVariables5'.
	ifMethod := self assembleFastMethodFromModelByName: 'ifMethod'.
	params := self assembleFastMethodFromModelByName: 'params'.
	supersimple := self assembleFastMethodFromModelByName: 'supersimple'.
	whileWhile := self assembleFastMethodFromModelByName: 'whileWhile'.
	forMethod := self assembleFastMethodFromModelByName: 'forMethod'.
	allMethods := {aLittleOfVariables.aLittleOfVariables2.aLittleOfVariables3.aLittleOfVariables4.aLittleOfVariables5.ifMethod.params.supersimple.whileWhile.forMethod}
]

{ #category : #tests }
JavaSmaCCGeneralizedMethodTestCase >> testMethodImport [
	allMethods do: [ :method | self assert: method notNil ]
]

{ #category : #tests }
JavaSmaCCGeneralizedMethodTestCase >> testMethodType [
	allMethods do: [ :method | self assert: (method isMemberOf: FASTJavaMethodEntity) ]
]

{ #category : #tests }
JavaSmaCCGeneralizedMethodTestCase >> testStatementsMethodReference [
	allMethods do: [ :method |
		self assert: (method statements allSatisfy: [ :statement | statement parentNode parentNode == method ]) ] 
]

{ #category : #tests }
JavaSmaCCGeneralizedMethodTestCase >> testStatementsShortcut [
	allMethods do: [ :method |
		self assert: method statementBlock statements equals: method statements ]  
]
