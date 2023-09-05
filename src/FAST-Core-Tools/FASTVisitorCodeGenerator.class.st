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
		self generateAcceptSelectorIn: st.
		self generatePragmaIn: st.
		st
			cr ;
			tab ;
			<< '^'.
		self generateVisitCallFor: modelClass on: 'aVisitor' argument: 'self' in: st ].

	modelClass compile: code classified: '*' , aPackageName
]

{ #category : #private }
FASTVisitorCodeGenerator >> generateAcceptSelectorIn: st [

	st << 'accept: aVisitor'
]

{ #category : #private }
FASTVisitorCodeGenerator >> generatePragmaIn: st [
	st
		cr ;
		tab ;
		<< '<generated>'
]

{ #category : #'code generation' }
FASTVisitorCodeGenerator >> generateVisit: aModelClass in: aVisitorClass [

	| parameter code category |
	parameter := 'a' , aModelClass name.
	code := String streamContents: [ :st |
		self
			generateVisitSelectorFor: aModelClass
			parameter: parameter
			in: st.
		self generatePragmaIn: st.

		aModelClass traits do: [ :aTrait |
			st cr ; tab.
			self generateVisitCallFor: aTrait on: 'self' argument: parameter in: st ]
	].

	category := aModelClass isTrait
		ifTrue: [ 'visiting - traits' ]
		ifFalse: [ 'visiting' ].

	aVisitorClass compile: code classified: category
]

{ #category : #private }
FASTVisitorCodeGenerator >> generateVisitCallFor: modelClass on: receiver argument: argument in: st [
	st
		<< receiver ;
		<< ' visit';
		<< modelClass name;
		<< ': ' ;
		<< argument ;
		<< '.'
]

{ #category : #private }
FASTVisitorCodeGenerator >> generateVisitSelectorFor: aModelClass parameter: parameter in: st [

	st
		<< 'visit';
		<< aModelClass name;
		<< ': ';
		<< parameter
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
