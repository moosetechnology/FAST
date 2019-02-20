Class {
	#name : #JavaSmaCCInnerNewClassInMethodTest,
	#superclass : #JavaSmaCCImporterTest,
	#instVars : [
		'methodNew'
	],
	#category : #'FAST-Java-SmaCC-Importer-Tests'
}

{ #category : #resources }
JavaSmaCCInnerNewClassInMethodTest >> methodInnerNewClass [
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

{ #category : #running }
JavaSmaCCInnerNewClassInMethodTest >> setUp [
	super setUp.
	methodNew := (self parseMethod: 'innerNewClass')
]

{ #category : #tests }
JavaSmaCCInnerNewClassInMethodTest >> testDeclaredMethodSize [
	self assert: (methodNew allWithType: FASTJavaNewClassExpression) anyOne methods size equals: 2
]

{ #category : #tests }
JavaSmaCCInnerNewClassInMethodTest >> testNewName [
	self assert: (methodNew allWithType: FASTJavaNewClassExpression) anyOne type name equals: 'Patate'
]

{ #category : #tests }
JavaSmaCCInnerNewClassInMethodTest >> testNewParent [
	self assert: (methodNew allWithType: FASTJavaNewClassExpression) anyOne parentNode equals: (methodNew allWithType: FASTJavaMethodInvocation) anyOne
]

{ #category : #tests }
JavaSmaCCInnerNewClassInMethodTest >> testNewParentChildren [
	self assert: (methodNew allWithType: FASTJavaNewClassExpression) anyOne equals: (methodNew allWithType: FASTJavaMethodInvocation) anyOne arguments anyOne
]

{ #category : #tests }
JavaSmaCCInnerNewClassInMethodTest >> testNumberOfMethod [
	self assert: methodNew allFASTJavaMethodEntity size equals: 3
]
