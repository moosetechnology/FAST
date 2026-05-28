"
Represents a generic behavioural entity which has parameters and local variables, as well as statements. 

Can represent a SmalltalkBlock, or a JavaLambda
Subclassed for NamedBehavioural as methods/functions

Has parameters , and a body (StatementBlock).
Local variables are intended to be stored in the local entities of the body

## Relations
======================

### Children
| Relation | Origin | Opposite | Type | Comment |
|---|
| `parameters` | `FASTTWithParameters` | `parameterOwner` | `FASTTVariableEntity` | My parameters|
| `statementBlock` | `FASTTWithStatements` | `fastBehaviouralParent` | `FASTTStatementBlock` | Statements block of the behavioural entity|


## Properties
======================

| Name | Type | Default value | Comment |
|---|
| `endPos` | `Number` | nil | |
| `startPos` | `Number` | nil | |

"
Trait {
	#name : 'FASTTBehaviouralEntity',
	#traits : 'FASTTScopableEntity + FASTTWithParameters + FASTTWithStatements',
	#classTraits : 'FASTTScopableEntity classTrait + FASTTWithParameters classTrait + FASTTWithStatements classTrait',
	#category : 'FAST-Core-Model-Traits',
	#package : 'FAST-Core-Model',
	#tag : 'Traits'
}

{ #category : 'meta' }
FASTTBehaviouralEntity classSide >> annotation [

	<FMClass: #TBehaviouralEntity super: #Object>
	<package: #'FAST-Core-Model'>
	<generated>
]

{ #category : 'testing' }
FASTTBehaviouralEntity >> isBehaviouralEntity [

	<generated>
	^ true
]
