Class {
	#name : #JavaSmaCCInnerNewClassInMethod,
	#superclass : #JavaSmaCCImporterTest,
	#instVars : [
		'methodNew'
	],
	#category : #'FAST-Java-SmaCC-Importer-Tests'
}

{ #category : #resources }
JavaSmaCCInnerNewClassInMethod >> methodInnerNewClass [
	^ 'void innerNewClass() {
	hello.say(new Patate() {
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
JavaSmaCCInnerNewClassInMethod >> setUp [
	methodNew := (self parseMethod: 'innerNewClass')
]

{ #category : #resources }
JavaSmaCCInnerNewClassInMethod >> testDeclaredMethodSize [
	self assert: (methodNew allWithType: FASTJavaNewClassExpression) anyOne methods size equals: 2
]

{ #category : #resources }
JavaSmaCCInnerNewClassInMethod >> testNewName [
	self assert: (methodNew allWithType: FASTJavaNewClassExpression) anyOne type name equals: 'Patate'
]

{ #category : #resources }
JavaSmaCCInnerNewClassInMethod >> testNewParent [
	self assert: (methodNew allWithType: FASTJavaNewClassExpression) anyOne parentNode equals: (methodNew allWithType: FASTJavaMethodInvocation) anyOne
]

{ #category : #resources }
JavaSmaCCInnerNewClassInMethod >> testNewParentChildren [
	self assert: (methodNew allWithType: FASTJavaNewClassExpression) anyOne equals: (methodNew allWithType: FASTJavaMethodInvocation) anyOne arguments anyOne
]

{ #category : #resources }
JavaSmaCCInnerNewClassInMethod >> testNumberOfMethod [
	self assert: methodNew allFASTJavaMethodEntity size equals: 3
]
