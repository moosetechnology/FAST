Class {
	#name : #JavaSmaCCEmptyMethodDeclarationTest,
	#superclass : #JavaSmaCCImporterTest,
	#instVars : [
		'methodNew'
	],
	#category : #'FAST-Java-SmaCC-Importer-Tests'
}

{ #category : #resources }
JavaSmaCCEmptyMethodDeclarationTest >> methodNew [
	^ 'void newMethod() {
	new Patate() {
		public void onSuccess(){
			System.out.println("Success");
		}
		;
		
		public void onFail(){
			System.out.println("Fail");
		}
	};
}'
]

{ #category : #running }
JavaSmaCCEmptyMethodDeclarationTest >> setUp [
	super setUp.
	methodNew := (self parseMethod: 'new')
]

{ #category : #tests }
JavaSmaCCEmptyMethodDeclarationTest >> testEmptyDeclaredMethodSize [
	self assert: (methodNew allWithType: FASTJavaEmptyMethodDeclaration) size equals: 1
]
