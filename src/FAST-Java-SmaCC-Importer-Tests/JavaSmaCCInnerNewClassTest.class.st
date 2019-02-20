Class {
	#name : #JavaSmaCCInnerNewClassTest,
	#superclass : #JavaSmaCCImporterTest,
	#instVars : [
		'methodNew'
	],
	#category : #'FAST-Java-SmaCC-Importer-Tests'
}

{ #category : #resources }
JavaSmaCCInnerNewClassTest >> methodInnerNewClass [
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

{ #category : #running }
JavaSmaCCInnerNewClassTest >> setUp [
	super setUp.
	methodNew := (self parseMethod: 'innerNewClass')
]

{ #category : #tests }
JavaSmaCCInnerNewClassTest >> testDeclaredMethodSize [
	self assert: (methodNew allWithType: FASTJavaNewClassExpression) anyOne methods size equals: 2
]

{ #category : #tests }
JavaSmaCCInnerNewClassTest >> testNewName [
	self assert: (methodNew allWithType: FASTJavaNewClassExpression) anyOne type name equals: 'Patate'
]

{ #category : #tests }
JavaSmaCCInnerNewClassTest >> testNewParent [
	self assert: (methodNew allWithType: FASTJavaNewClassExpression) anyOne parentNode equals: (methodNew allWithType: FASTJavaNewExpression) anyOne
]

{ #category : #tests }
JavaSmaCCInnerNewClassTest >> testNewParentChildren [
	self assert: (methodNew allWithType: FASTJavaNewClassExpression) anyOne equals: (methodNew allWithType: FASTJavaNewExpression) anyOne arguments anyOne
]

{ #category : #tests }
JavaSmaCCInnerNewClassTest >> testNumberOfMethod [
	self assert: methodNew allFASTJavaMethodEntity size equals: 3
]
