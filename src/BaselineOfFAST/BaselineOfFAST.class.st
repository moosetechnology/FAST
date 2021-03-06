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
			spec blessing: #baseline.
			spec description: 'Developement version of FAST using FamixNG for Pharo.'.
			spec author: 'BenoitVerhaeghe'.
			spec timestamp: '07/06/2018 00:00'.
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
		group: 'core' with: #('FAST-Core-Model-Extension' 'FAST-Core-Model' 'FAST-Model-Generator' 'FAST-Core-Visitor' 'FAST-GTExtensions' 'FAST-Core-Deprecated');
		group: 'default' with: #('core')
]

{ #category : #baselines }
BaselineOfFAST >> definePackages: spec [
	spec
		repository: 'https://github.com/moosetechnology/FAST';
		package: 'FAST-Core-Model';
		package: 'FAST-Core-Visitor';
		package: 'FAST-Core-Model-Extension' with: [ spec requires: #('FAST-Core-Model') ];
		package: 'FAST-Model-Generator';
		package: 'FAST-Core-Highlighter';
		package: 'FAST-GTExtensions' with: [ spec requires: #('FAST-Core-Model' 'FAST-Core-Highlighter' 'FAST-Core-Model-Extension') ];
		package: 'FAST-Core-Deprecated'
]
