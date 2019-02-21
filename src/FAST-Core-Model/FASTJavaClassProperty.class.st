"
A FASTJavaClassProperty corresponds to the access to a class property
	
	It is not the same as the field access because there are some specific usage of class property to access the current object.
	
ex.

class Enclosing {
    void method(Enclosing other) {
        // ...
    }

    void otherMethod() {
        new Runnable() {
            public void run() {
                method(this);


								--> Does not compile. 'this' is a Runnable!



                method(Enclosing.this);

								--> Compiles fine.


            }
        }.run();
    }
}

"
Class {
	#name : #FASTJavaClassProperty,
	#superclass : #FASTExpression,
	#instVars : [
		'type',
		'fieldName'
	],
	#category : #'FAST-Core-Model-Entities'
}

{ #category : #meta }
FASTJavaClassProperty class >> annotation [

	<MSEClass: #JavaClassProperty super: #FASTExpression>
	<package: #'FAST-Core-Model'>
	<generated>
	^self
]

{ #category : #generator }
FASTJavaClassProperty class >> generatedSlotNames [
	<generated>
	'FASTJavaClassProperty class>>#generatedSlotNames'.
	^ #(fieldName type)
]

{ #category : #generator }
FASTJavaClassProperty class >> generatedTraitNames [
	<generated>
	^ #()
]

{ #category : #meta }
FASTJavaClassProperty class >> requirements [

	<generated>
	^ {  }
]

{ #category : #accessing }
FASTJavaClassProperty >> fieldName [

	<MSEProperty: #fieldName type: #String>
	<generated>
	<MSEComment: 'Name of accessed field'>
	^ fieldName
]

{ #category : #accessing }
FASTJavaClassProperty >> fieldName: anObject [

	<generated>
	fieldName := anObject

]

{ #category : #accessing }
FASTJavaClassProperty >> type [

	<MSEProperty: #type type: #FASTNamedEntity>
	<generated>
	<MSEComment: 'The owner type'>
	^ type
]

{ #category : #accessing }
FASTJavaClassProperty >> type: anObject [

	<generated>
	type := anObject

]
