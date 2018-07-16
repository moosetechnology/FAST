accessing
resetMetamodel

	" self resetMetamodel"

	| classes tower |

	FMRelationSlot allSubInstancesDo: #resetMooseProperty.

	classes := self packageName asPackage definedClasses
		select: [ :each | each inheritsFrom: MooseEntity ].
	classes addAll: (self packageName asPackage definedClasses select: #isTrait).
	classes addAll: #'FmxNG-Traits' asPackage definedClasses.
	"Add old famix to do an extension"
	classes addAll: ('FmxNGCompatibility-Entities' asPackage definedClasses select: [ :each | each inheritsFrom: MooseEntity ]).
	
	{ Trait. 	Class. ClassDescription. Behavior. MooseModel. MooseAbstractGroup. MooseEntity. MooseGroup} 
		do: [ :each | classes add: each ].
	tower := MooseModel metaBuilder: classes.
	self metamodel: tower metamodel.
	
	