Class {
	#name : 'BaselineOfFAST',
	#superclass : 'BaselineOf',
	#category : 'BaselineOfFAST',
	#package : 'BaselineOfFAST'
}

{ #category : 'baselines' }
BaselineOfFAST >> baseline: spec [

	<baseline>
	spec for: #common do: [
			spec postLoadDoIt: #ensureMoose12Compatibility.

			self defineDependencies: spec.
			self definePackages: spec.
			self defineGroups: spec ]
]

{ #category : 'baselines' }
BaselineOfFAST >> customProjectAttributes [

	^ self class environment
		  at: #BaselineOfFamix
		  ifPresent: [ #(  ) ]
		  ifAbsent: [ #( #NeedsMoose ) ]
]

{ #category : 'baselines' }
BaselineOfFAST >> defineDependencies: spec [

	spec for: #NeedsMoose do: [
			spec baseline: 'Famix' with: [
					spec
						loads: #( 'Basic' 'BasicTraits' );
						repository: 'github://moosetechnology/Famix:development/src' ].

			spec project: 'FamixTests' copyFrom: 'Famix' with: [ spec loads: 'Tests' ] ]
]

{ #category : 'baselines' }
BaselineOfFAST >> defineGroups: spec [

	spec
		group: 'core' with: #( 'FAST-Core-Model' 'FAST-Core-Model-Extension' 'FAST-Model-Generator' 'FAST-Core-Visitor' );
		group: 'All' with: #( 'core' 'FAST-Core-Tools' 'FAST-Core-Tools-Tests' );
		group: 'tools' with: #( 'All' );
		group: 'default' with: #( 'core' )
]

{ #category : 'baselines' }
BaselineOfFAST >> definePackages: spec [

	spec
		package: 'FAST-Core-Model';
		package: 'FAST-Core-Model-Extension' with: [ spec requires: #( 'FAST-Core-Model' ) ];
		package: 'FAST-Core-Visitor' with: [ spec requires: #( 'FAST-Core-Model' ) ];
		package: 'FAST-Model-Generator';
		package: 'FAST-Core-Tools' with: [ spec requires: #( 'FAST-Core-Visitor' ) ];
		package: 'FAST-Core-Tools-Tests' with: [ spec requires: #( 'FAST-Core-Tools' ) ];
		package: 'FAST-Core-Deprecated'.

	spec for: #NeedsMoose do: [
			spec
				package: 'FAST-Core-Model' with: [ spec requires: #( 'Famix' ) ];
				package: 'FAST-Model-Generator' with: [ spec requires: #( 'Famix' ) ];
				package: 'FAST-Core-Tools-Tests' with: [ spec requires: #( 'FamixTests' ) ] ]
]

{ #category : 'baselines' }
BaselineOfFAST >> ensureMoose12Compatibility [
	"FAST v3 works on Moose 12 and Moose 13. Since we are using some methods of Moose 13, I ensure we have everything needed. Delete me once Moose 12 support will be dropped."

	| class |
	class := self class environment at: #TEntityMetaLevelDependency.

	(class includesSelector: #containersOfType:) ifFalse: [
			class
				compile: 'containersOfType: aType
	"I am used to return all the first encountered entities at a given famix class scope that are up in the containment tree of the metamodel"

	^ self query containers ofType: aType'
				classified: '*FAST-Moose12-Compatibility' ]
]
