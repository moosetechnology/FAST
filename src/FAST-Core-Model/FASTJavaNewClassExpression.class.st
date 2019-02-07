"
I represent a new class expression (which is most of the time a new anonymous class)
	
	
ex. for SecureAsyncCallback

new SecureAsyncCallback<Void>() {
	@Override
	public void onSuccess(final Void result) {}
	
	@Override
	public void onFailure(final Throwable caught) {
		super.onFailure(caught);
	}
}
"
Class {
	#name : #FASTJavaNewClassExpression,
	#superclass : #FASTJavaNewExpression,
	#category : #'FAST-Core-Model-Entities'
}

{ #category : #meta }
FASTJavaNewClassExpression class >> annotation [

	<MSEClass: #JavaNewClassExpression super: #FASTJavaNewExpression>
	<package: #'FAST-Core-Model'>
	<generated>
	^self
]

{ #category : #generator }
FASTJavaNewClassExpression class >> generatedSlotNames [
	<generated>
	'FASTJavaNewClassExpression class>>#generatedSlotNames'.
	^ #()
]

{ #category : #generator }
FASTJavaNewClassExpression class >> generatedTraitNames [
	<generated>
	^ #()
]

{ #category : #meta }
FASTJavaNewClassExpression class >> requirements [

	<generated>
	^ {  }
]
