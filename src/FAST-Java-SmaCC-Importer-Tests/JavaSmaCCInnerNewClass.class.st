Class {
	#name : #JavaSmaCCInnerNewClass,
	#superclass : #JavaSmaCCImporterTest,
	#instVars : [
		'methodNew'
	],
	#category : #'FAST-Java-SmaCC-Importer-Tests'
}

{ #category : #resources }
JavaSmaCCInnerNewClass >> methodInnerNewClass [
	^ 'void innerNewClass() {
	new Hello(new Patate() {
		public void onSuccess(){
			System.out.println("Success");
		}
		
		public void onFail(){
			System.out.println("Fail");
		}
	});
}'
]

{ #category : #resources }
JavaSmaCCInnerNewClass >> setUp [
	methodNew := (self parseMethod: 'innerNewClass')
]

{ #category : #resources }
JavaSmaCCInnerNewClass >> testDeclaredMethodSize [
	self assert: (methodNew allWithType: FASTJavaNewClassExpression) anyOne methods size equals: 2
]

{ #category : #resources }
JavaSmaCCInnerNewClass >> testNewName [
	self assert: (methodNew allWithType: FASTJavaNewClassExpression) anyOne name equals: 'Patate'
]

{ #category : #resources }
JavaSmaCCInnerNewClass >> testNewParent [
	self assert: (methodNew allWithType: FASTJavaNewClassExpression) anyOne parentNode equals: (methodNew allWithType: FASTJavaNewExpression) anyOne
]

{ #category : #resources }
JavaSmaCCInnerNewClass >> testNewParentChildren [
	self assert: (methodNew allWithType: FASTJavaNewClassExpression) anyOne equals: (methodNew allWithType: FASTJavaNewExpression) anyOne arguments anyOne
]

{ #category : #resources }
JavaSmaCCInnerNewClass >> testNumberOfMethod [
	self assert: methodNew allFASTJavaMethodEntity size equals: 3
]
