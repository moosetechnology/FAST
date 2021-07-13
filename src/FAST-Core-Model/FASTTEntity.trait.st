"
any entity
"
Trait {
	#name : #FASTTEntity,
	#instVars : [
		'#endPos => FMProperty',
		'#startPos => FMProperty'
	],
	#traits : 'TEntityMetaLevelDependency',
	#classTraits : 'TEntityMetaLevelDependency classTrait',
	#category : #'FAST-Core-Model-Traits'
}

{ #category : #meta }
FASTTEntity classSide >> annotation [

	<FMClass: #TEntity super: #Object>
	<package: #'FAST-Core-Model'>
	<generated>
	^self
]

{ #category : #accessing }
FASTTEntity >> endPos [

	<FMProperty: #endPos type: #Number>
	<generated>
	^ endPos
]

{ #category : #accessing }
FASTTEntity >> endPos: anObject [
	<generated>
	endPos := anObject
]

{ #category : #accessing }
FASTTEntity >> startPos [

	<FMProperty: #startPos type: #Number>
	<generated>
	^ startPos
]

{ #category : #accessing }
FASTTEntity >> startPos: anObject [
	<generated>
	startPos := anObject
]
