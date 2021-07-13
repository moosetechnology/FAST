"
A literal node.

Contains a value for the literal.

FLAG: should refactor some literals to core-model
    e.g.: character, int, float, string, boolean 
"
Trait {
	#name : #FASTTLiteral,
	#instVars : [
		'#value => FMProperty'
	],
	#traits : 'FASTTExpression',
	#classTraits : 'FASTTExpression classTrait',
	#category : #'FAST-Core-Model-Traits'
}

{ #category : #meta }
FASTTLiteral classSide >> annotation [

	<FMClass: #TLiteral super: #Object>
	<package: #'FAST-Core-Model'>
	<generated>
	^self
]

{ #category : #accessing }
FASTTLiteral >> value [

	<FMProperty: #value type: #String>
	<generated>
	<FMComment: 'The literal itself as found in the source code'>
	^ value
]

{ #category : #accessing }
FASTTLiteral >> value: anObject [
	<generated>
	value := anObject
]
