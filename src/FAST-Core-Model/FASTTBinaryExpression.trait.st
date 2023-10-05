"
A trait representing a binary expression of a node of a source code.
"
Trait {
	#name : #FASTTBinaryExpression,
	#traits : 'FASTTExpression',
	#classTraits : 'FASTTExpression classTrait',
	#category : #'FAST-Core-Model-Traits'
}

{ #category : #meta }
FASTTBinaryExpression classSide >> annotation [

	<FMClass: #TBinaryExpression super: #Object>
	<package: #'FAST-Core-Model'>
	<generated>
	^ self
]
