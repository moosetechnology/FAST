"
I am a Pharo code generator to implement the basic infrastructure for FAST visitors

I generate the `#accept:` methods in the meta-model classes and the `#visitXYZ:` methods in the visitor.
To use:
```
FASTVisitorCodeGenerator new
	rootClass: FASTXYZEntity visitorClass: FASTXYZVisitor
```
Assumptions:
- Classes and traits of the meta-model are all gathered in one package (typically **FAST-XYZ-Entities**) where the root entity class (**FASTXYZEntity**) is also located
- The class **FASTXYZVisitor** should exist
- The `#accept:` methods are generated in the model entities (subclasses of **FASTXYZEntity**) as extension of the package owning **FASTXYZVisitor**

Thus for FAST-Java:
- Meta-model classes and traits are located in one package (FAST-Java-entities)
- The visitor is FASTJavaVisitor, located in FAST-Java-Visitor package
- `#accept:` methods in the meta-model classes will be extension of the FAST-Java-Visitor package
"
Class {
	#name : #FASTVisitorCodeGenerator,
	#superclass : #Object,
	#category : #'FAST-Core-Tools-VisitorGenerator'
}

{ #category : #'code generation' }
FASTVisitorCodeGenerator >> generateAccept: modelClass extensionPackage: aPackageName [
	| code |
	code := String streamContents: [ :st |
		st
			<< 'accept: aVisitor' ;
			cr ;
			tab ;
			<< '^aVisitor visit' ;
			<< modelClass name ;
			<< ': self'
	].

	modelClass
		compile: code
		classified: ('*' , aPackageName)
]

{ #category : #'code generation' }
FASTVisitorCodeGenerator >> generateVisit: aModelClass in: aVisitorClass [
	| parameter code category |
	parameter := 'a' , aModelClass name.
	code := String streamContents: [ :st |
		st
			<< 'visit' ;
			<< aModelClass name ;
			<< ': ' ;
			<< parameter.

		aModelClass traits do: [ :aTrait |
			st
				cr ;
				tab ;
				<< 'self visit' ;
				<< aTrait name ;
				<< ': ' ;
				<< parameter ;
				<< '.'.
		].
	].

	category := aModelClass isTrait
		ifTrue: [ 'visiting' ]
		ifFalse: [ 'visiting - traits' ].
	aVisitorClass
		compile: code
		classified: category
]

{ #category : #run }
FASTVisitorCodeGenerator >> rootClass: aFASTEntityClass visitorClass: aFASTVisitorClass [
	aFASTEntityClass withAllSubclassesDo: [ :modelClass |
		self generateAccept: modelClass extensionPackage: aFASTVisitorClass package name.
		self generateVisit: modelClass in: aFASTVisitorClass.
	].
	(aFASTEntityClass package classes select: #isTrait) do: [ :modelTrait |
		self generateVisit: modelTrait in: aFASTVisitorClass.
	].
]
