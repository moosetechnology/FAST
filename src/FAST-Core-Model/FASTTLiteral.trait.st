"
A literal node.

Contains a value for the literal.

FLAG: should refactor some literals to core-model
    e.g.: character, int, float, string, boolean 
"
Trait {
	#name : #FASTTLiteral,
	#instVars : [
		'#primitiveValue => FMProperty'
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
FASTTLiteral >> primitiveValue [

	<FMProperty: #primitiveValue type: #String>
	<generated>
	<FMComment: 'The literal itself as found in the source code. We use primitiveValue in order to override value from Object'>
	^ primitiveValue
]

{ #category : #accessing }
FASTTLiteral >> primitiveValue: anObject [
	<generated>
	primitiveValue := anObject
]
