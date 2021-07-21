"
A node that wraps around structural entity
"
Trait {
	#name : #FASTTVariableExpression,
	#traits : 'FASTTExpression + FASTTNamedEntity',
	#classTraits : 'FASTTExpression classTrait + FASTTNamedEntity classTrait',
	#category : #'FAST-Core-Model-Traits'
}

{ #category : #meta }
FASTTVariableExpression classSide >> annotation [

	<FMClass: #TVariableExpression super: #Object>
	<package: #'FAST-Core-Model'>
	<generated>
	^self
]
