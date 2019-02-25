"
I reprensent an empty method declaration
	
ex.:
void newMethod() {
	new Patate() {
		//The empty method declaration is "";"" 
		;
		
	};
}
"
Class {
	#name : #FASTJavaEmptyMethodDeclaration,
	#superclass : #FASTJavaMethodEntity,
	#category : #'FAST-Core-Model-Entities'
}

{ #category : #meta }
FASTJavaEmptyMethodDeclaration class >> annotation [

	<MSEClass: #JavaEmptyMethodDeclaration super: #FASTJavaMethodEntity>
	<package: #'FAST-Core-Model'>
	<generated>
	^self
]

{ #category : #generator }
FASTJavaEmptyMethodDeclaration class >> generatedSlotNames [
	<generated>
	'FASTJavaEmptyMethodDeclaration class>>#generatedSlotNames'.
	^ #()
]

{ #category : #generator }
FASTJavaEmptyMethodDeclaration class >> generatedTraitNames [
	<generated>
	^ #()
]

{ #category : #meta }
FASTJavaEmptyMethodDeclaration class >> requirements [

	<generated>
	^ {  }
]
