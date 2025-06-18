"
I represent any loop statement (for, while...)

## Properties
======================

| Name | Type | Default value | Comment |
|---|
| `label` | `String` | nil | |

"
Trait {
	#name : 'FASTTLabeledStatement',
	#instVars : [
		'#label => FMProperty'
	],
	#category : 'FAST-Core-Model-Traits',
	#package : 'FAST-Core-Model',
	#tag : 'Traits'
}

{ #category : 'meta' }
FASTTLabeledStatement classSide >> annotation [

	<FMClass: #TLabeledStatement super: #Object>
	<package: #'FAST-Core-Model'>
	<generated>
	^ self
]

{ #category : 'accessing' }
FASTTLabeledStatement >> label [

	<FMProperty: #label type: #String>
	<generated>
	^ label
]

{ #category : 'accessing' }
FASTTLabeledStatement >> label: anObject [
	<generated>
	label := anObject
]
