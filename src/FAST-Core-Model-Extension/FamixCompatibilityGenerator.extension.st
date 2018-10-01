Extension { #name : #FamixCompatibilityGenerator }

{ #category : #'*FAST-Core-Model-Extension' }
FamixCompatibilityGenerator class >> resetMetamodel [

	" self resetMetamodel"

	| classes tower |

	FMRelationSlot allSubInstancesDo: #resetMooseProperty.

	classes := self packageName asPackage definedClasses
		select: [ :each | each inheritsFrom: MooseEntity ].
	classes addAll: (FASTEntity withAllSubclasses).
	classes addAll: (self packageName asPackage definedClasses select: #isTrait).
	classes addAll: #'Famix-Traits' asPackage definedClasses.
	{ Trait. 	Class. ClassDescription. Behavior. MooseModel. MooseAbstractGroup. MooseEntity. MooseGroup} 
		do: [ :each | classes add: each ].
	tower := MooseModel metaBuilder: classes.
	self metamodel: tower metamodel.
	
	^ metamodel
]
