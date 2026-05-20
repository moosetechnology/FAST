"
any entity

## Properties
======================

| Name | Type | Default value | Comment |
|---|
| `endPos` | `Number` | nil | |
| `startPos` | `Number` | nil | |

"
Trait {
	#name : 'FASTTEntity',
	#instVars : [
		'#startPos => FMProperty',
		'#endPos => FMProperty'
	],
	#traits : 'TEntityMetaLevelDependency',
	#classTraits : 'TEntityMetaLevelDependency classTrait',
	#category : 'FAST-Core-Model-Traits',
	#package : 'FAST-Core-Model',
	#tag : 'Traits'
}

{ #category : 'meta' }
FASTTEntity classSide >> annotation [

	<FMClass: #TEntity super: #Object>
	<package: #'FAST-Core-Model'>
	<generated>
	^ self
]

{ #category : 'printing' }
FASTTEntity >> displayFullStringOn: aStream [

	self printOn: aStream
]

{ #category : 'printing' }
FASTTEntity >> displayStringOn: aStream [

	self printOn: aStream
]

{ #category : 'accessing' }
FASTTEntity >> endPos [

	<FMProperty: #endPos type: #Number>
	<generated>
	^ endPos
]

{ #category : 'accessing' }
FASTTEntity >> endPos: anObject [
	<generated>
	endPos := anObject
]

{ #category : 'testing' }
FASTTEntity >> isNonLocalDeclaration [

	^false
]

{ #category : 'printing' }
FASTTEntity >> printOn: aStream [

	aStream
		nextPutAll: (self class name withoutPrefix: 'FAST');
		nextPut: $(;
		print: (self startPos ifNil: [ Float nan ]);
		nextPutAll: ' - ';
		print: (self endPos ifNil: [ Float nan ]);
		nextPut: $)
]

{ #category : 'accessing' }
FASTTEntity >> startPos [

	<FMProperty: #startPos type: #Number>
	<generated>
	^ startPos
]

{ #category : 'accessing' }
FASTTEntity >> startPos: anObject [
	<generated>
	startPos := anObject
]
