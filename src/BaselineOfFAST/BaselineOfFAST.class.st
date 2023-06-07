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
]

{ #category : #baselines }
BaselineOfFAST >> definePackages: spec [
	spec
		package: 'FAST-Core-Model';
		package: 'FAST-Core-Visitor';
		package: 'FAST-Core-Model-Extension' with: [ spec requires: #('FAST-Core-Model') ];
		package: 'FAST-Model-Generator';
		package: 'FAST-Core-Highlighter';
		package: 'FAST-Core-Deprecated'
]
