"
I am a Pharo code generator to implement the basic infrastructure for FAST visitors.
I only generate calls to superclass and used traits, I do not do anything with the properties of the visited nodes.

I generate the `#accept:` methods in the meta-model classes and the `#visit<XYZ>:` methods in the visitor.
To use:
```
FASTVisitorCodeGenerator new
	rootClass: FAST<XYZ>Entity visitorClass: FAST<XYZ>Visitor
```
Assumptions:
- Classes and traits of the meta-model are all gathered in one package (typically **FAST-<XYZ>-Entities**) where the root entity class (**FAST<XYZ>Entity**) is also located
- The class **FAST<XYZ>Visitor** should exist
- The `#accept:` methods are generated in the model entities (subclasses of **FAST<XYZ>Entity**) as extension of the package owning **FAST<XYZ>Visitor**

Thus for FAST-Java:
- Meta-model classes and traits are located in one package (FAST-Java-entities)
- The visitor is FASTJavaVisitor, located in FAST-Java-Visitor package
- `#accept:` methods in the meta-model classes will be extension of the FAST-Java-Visitor package
"
Class {
	#name : 'FASTVisitorCodeGenerator',
	#superclass : 'Object',
	#instVars : [
		'rootClass',
		'visitorClass'
	],
	#category : 'FAST-Core-Tools-VisitorGenerator',
	#package : 'FAST-Core-Tools',
	#tag : 'VisitorGenerator'
}

{ #category : 'code generation' }
FASTVisitorCodeGenerator >> asParameterName: aModelClass [
	"generates a parameter name from a class name"

	^'a' , aModelClass name
]

{ #category : 'run' }
FASTVisitorCodeGenerator >> compileCode: code into: aModelClass [

	visitorClass compile: code classified: (aModelClass isTrait
			 ifTrue: [ 'visiting - traits' ]
			 ifFalse: [ 'visiting' ])
]

{ #category : 'code generation' }
FASTVisitorCodeGenerator >> generateAccept: modelClass [
	"generates and #accept: method in modelClass as extension of the package of the visitorClass.
	 Note the trick in calling #generateVisitCallFor:receiver:argument:on: where the 'receiver'
	 includes a return statement"

	| code |
	code := String streamContents: [ :stream |
		self generateAcceptSelectorOn: stream.
		self generatePragmaOn: stream.
		self generateVisitCallFor: modelClass receiver: '^ aVisitor' argument: 'self' on: stream
	].

	modelClass compile: code classified: '*' , visitorClass package name
]

{ #category : 'code generation' }
FASTVisitorCodeGenerator >> generateAcceptSelectorOn: stream [

	stream
		<< 'accept: aVisitor' ;
		cr
]

{ #category : 'code generation' }
FASTVisitorCodeGenerator >> generatePragmaOn: stream [

	stream
		tab ;
		<< '<generated>' ;
		cr
]

{ #category : 'code generation' }
FASTVisitorCodeGenerator >> generateVisitCallFor: modelClass receiver: receiver argument: argument on: stream [
	"generates an invocation of a #visit: method, with an argument of type modelClass
	 reusing the method that generates the visit selector"

	stream
		tab ;
		<< receiver ;
		space.

	self generateVisitSelectorFor: modelClass parameter: argument on: stream.
	stream
		<< '.' ;
		cr
]

{ #category : 'run' }
FASTVisitorCodeGenerator >> generateVisitFor: aModelClass [
	"main method: generates a default visit method for instances of aModelClass and put it in visitorClass
	 - first generates the selector and put a 'generated' pragma
	 - then generates calls to #visitSomeTrait: for used traits
	 - then generates a call to #visit<superclass>:
	 - then compiles the method"

	| code |
	code := String streamContents: [ :stream |
		self generateVisitMethodHeader: aModelClass on: stream.
		self generateVisitForBodyOf: aModelClass on: stream ].

	self compileCode: code into: aModelClass
]

{ #category : 'run' }
FASTVisitorCodeGenerator >> generateVisitForBodyOf: aModelClass on: stream [

	self generateVisitToTraits: aModelClass on: stream.
	self generateVisitToSuperclass: aModelClass on: stream
]

{ #category : 'run' }
FASTVisitorCodeGenerator >> generateVisitMethodHeader: aModelClass on: stream [

	self
		generateVisitSelectorFor: aModelClass
		parameter: (self asParameterName: aModelClass)
		on: stream.
	stream cr.
	self generatePragmaOn: stream
]

{ #category : 'code generation' }
FASTVisitorCodeGenerator >> generateVisitSelectorFor: aModelClass parameter: parameter on: stream [

	stream
		<< 'visit';
		<< aModelClass name;
		<< ': ';
		<< parameter
]

{ #category : 'run' }
FASTVisitorCodeGenerator >> generateVisitToSuperclass: aModelClass on: stream [

	aModelClass superclass ifNotNil: [ :superclass |
		superclass = rootClass ifFalse: [
			self
				generateVisitCallFor: superclass
				receiver: 'self'
				argument: (self asParameterName: aModelClass)
				on: stream
		]
	]
]

{ #category : 'run' }
FASTVisitorCodeGenerator >> generateVisitToTraits: aModelClass on: stream [
	"generates calls to traits used by aModelClass and not used by its super-classes
	 (because they will alreay have a class to visit that trait)"

	(self traitsToVisitFor: aModelClass) do: [ :aTrait |
		self
			generateVisitCallFor: aTrait
			receiver: 'self'
			argument: (self asParameterName: aModelClass)
			on: stream ].
]

{ #category : 'run' }
FASTVisitorCodeGenerator >> rootClass: aFASTEntityClass visitorClass: aFASTVisitorClass [
	"entry point for the generation.
	 For all subclasses of aFASTEntityClass will generate an #accept: method in that class and
	 a #visit: method in aFASTVisitorClass
	 Then do the same for all traits in the package of aFASTEntityClass"

	rootClass := aFASTEntityClass.
	visitorClass := aFASTVisitorClass.

	aFASTEntityClass withAllSubclassesDo: [ :modelClass |
		self generateAccept: modelClass.
		self generateVisitFor: modelClass.
	].

	aFASTEntityClass package classes do: [ :modelClass |
		modelClass isTrait 
			ifTrue: [ self generateVisitFor: modelClass ]
	].
]

{ #category : 'private' }
FASTVisitorCodeGenerator >> trait: aTrait usedBySuperClassOf: aModelClass [

	| superclass |
	(aModelClass = rootClass) ifTrue: [ ^false ].

	superclass := aModelClass superclass.
	superclass ifNil: [ ^false ].

	(superclass traits includes: aTrait) ifTrue: [ ^true ].

	^self trait: aTrait usedBySuperClassOf: aModelClass superclass
]

{ #category : 'private' }
FASTVisitorCodeGenerator >> traitsToVisitFor: aModelClass [
	"gather the traits used by aModelClass that are not used by any of its super-classes
	The root class is assumed to not use any trait"

	(aModelClass = rootClass) ifTrue: [ ^#() ].

	^aModelClass traits reject: [ :aTrait | self trait: aTrait usedBySuperClassOf: aModelClass ]
]
