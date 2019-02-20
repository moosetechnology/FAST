Class {
	#name : #JavaSmaCCClassExpressionTest,
	#superclass : #JavaSmaCCImporterTest,
	#instVars : [
		'methodClassExpression'
	],
	#category : #'FAST-Java-SmaCC-Importer-Tests'
}

{ #category : #resources }
JavaSmaCCClassExpressionTest >> methodClassExpression [
	^ 'void arrayAccess() {
   int i = Hello.property;
}'
]

{ #category : #running }
JavaSmaCCClassExpressionTest >> setUp [
	super setUp.
	methodClassExpression := (self parseMethod: 'ClassExpression')
		allFASTJavaMethodEntity first
]

{ #category : #tests }
JavaSmaCCClassExpressionTest >> testClassExpressionFieldName [
	self assert: methodClassExpression statements anyOne declarators anyOne expression fieldName equals: 'property' 
]

{ #category : #tests }
JavaSmaCCClassExpressionTest >> testClassExpressionParent [
	self assert: methodClassExpression statements anyOne declarators anyOne expression parentNode equals: methodClassExpression statements anyOne declarators anyOne 
]

{ #category : #tests }
JavaSmaCCClassExpressionTest >> testClassExpressionSize [
	self assert: (methodClassExpression mooseModel allWithType: FASTJavaClassProperty) size equals: 1 
]

{ #category : #tests }
JavaSmaCCClassExpressionTest >> testClassExpressionType [
	self assert: methodClassExpression statements anyOne declarators anyOne expression class equals: FASTJavaClassProperty 
]
