"
A trait representing an unary expression of a node of a source code.
"
Trait {
	#name : #FASTTUnaryExpression,
	#traits : 'FASTTExpression',
	#classTraits : 'FASTTExpression classTrait',
	#category : #'FAST-Core-Model-Traits'
}

{ #category : #meta }
FASTTUnaryExpression classSide >> annotation [

	<FMClass: #TUnaryExpression super: #Object>
	<package: #'FAST-Core-Model'>
	<generated>
	^ self
]
