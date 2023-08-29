Class {
	#name : #BaselineOfFAST,
	#superclass : #BaselineOf,
	#category : #BaselineOfFAST
}

{ #category : #baselines }
BaselineOfFAST >> baseline: spec [
	<baseline>
	spec
		for: #common
		do: [ 
			self defineDependencies: spec.
			self definePackages: spec.
			self defineGroups: spec ]
]

{ #category : #baselines }
BaselineOfFAST >> defineDependencies: spec [
]

{ #category : #baselines }
BaselineOfFAST >> defineGroups: spec [
	spec
		group: 'core'
		with: #( 'FAST-Core-Model' 'FAST-Core-Model-Extension' 'FAST-Model-Generator'  'FAST-Core-Visitor' ) ;

		group: 'tools'
		with: #( 'FAST-Core-Tools' 'FAST-Core-Tools-Tests' ) ;

		group: 'default' with: #( 'core' )

]

{ #category : #baselines }
BaselineOfFAST >> definePackages: spec [
	spec
		package: 'FAST-Core-Model' ;
		package: 'FAST-Core-Model-Extension' with: [ spec requires: #('FAST-Core-Model') ] ;
		package: 'FAST-Core-Visitor' ;
		package: 'FAST-Model-Generator' ;
		package: 'FAST-Core-Tools' with: [ spec requires: #('FAST-Core-Visitor') ] ;
		package: 'FAST-Core-Tools-Tests' with: [ spec requires: #('FAST-Core-Tools') ] ;
		package: 'FAST-Core-Deprecated'
]
