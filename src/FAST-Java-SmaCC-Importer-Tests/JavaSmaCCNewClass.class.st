Class {
	#name : #JavaSmaCCNewClass,
	#superclass : #JavaSmaCCImporterTest,
	#instVars : [
		'methodNew'
	],
	#category : #'FAST-Java-SmaCC-Importer-Tests'
}

{ #category : #resources }
JavaSmaCCNewClass >> methodNew [
	^ 'void newMethod() {
	new Patate() {
		public void onSuccess(){
			System.out.println("Success");
		}
		
		public void onFail(){
			System.out.println("Fail");
		}
	};
}'
]

{ #category : #resources }
JavaSmaCCNewClass >> setUp [
	methodNew := (self parseMethod: 'new')
]

{ #category : #resources }
JavaSmaCCNewClass >> testDeclaredMethodSize [
	self assert: (methodNew allWithType: FASTJavaNewClassExpression) anyOne methods size equals: 2
]

{ #category : #resources }
JavaSmaCCNewClass >> testNewName [
	self assert: (methodNew allWithType: FASTJavaNewClassExpression) anyOne name equals: 'Patate'
]

{ #category : #resources }
JavaSmaCCNewClass >> testNewParent [
	self assert: (methodNew allWithType: FASTJavaNewClassExpression) anyOne parentNode equals: (methodNew entityNamed: 'newMethod') statements anyOne
]

{ #category : #resources }
JavaSmaCCNewClass >> testNumberOfMethod [
	self assert: methodNew allFASTJavaMethodEntity size equals: 3
]
