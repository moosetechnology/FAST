"
## Relations
======================

### Children
| Relation | Origin | Opposite | Type | Comment |
|---|
| `condition` | `FASTTWithCondition` | `parentConditional` | `FASTTExpression` | The boolean condition tested|



"
Trait {
	#name : 'FASTTWithCondition',
	#instVars : [
		'#condition => FMOne type: #FASTTExpression opposite: #parentConditional'
	],
	#category : 'FAST-Core-Model-Traits',
	#package : 'FAST-Core-Model',
	#tag : 'Traits'
}

{ #category : 'meta' }
FASTTWithCondition classSide >> annotation [

	<FMClass: #TWithCondition super: #Object>
	<package: #'FAST-Core-Model'>
	<generated>
	^ self
]

{ #category : 'accessing' }
FASTTWithCondition >> condition [
	"Relation named: #condition type: #FASTTExpression opposite: #parentConditional"

	<generated>
	<FMComment: 'The boolean condition tested'>
	^ condition
]

{ #category : 'accessing' }
FASTTWithCondition >> condition: anObject [

	<generated>
	condition := anObject
]
