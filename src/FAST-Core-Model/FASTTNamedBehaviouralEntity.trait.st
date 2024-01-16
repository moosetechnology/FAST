"
@FLAG: May be could be removed to have a simpler core model.
Each language would have to implement it correctly then

A behavioural entity that can be referenced with a name.

Assumed to correspond to a function or a method

## Relations
======================

### Children
- Relation: #parameters Type: #FASTTVariableEntity Opposite: #parameterOwner Comment: My parameters
- Relation: #statementBlock Type: #FASTTStatementBlock Opposite: #fastBehaviouralParent Comment: Statements block of the behavioural entity
### Other
- Relation: #invokedIn Type: #FASTTInvocation Opposite: #invoked Comment: Optional invocation where this name is used

## Properties
======================

- Named: #endPos Type: Number
- Named: #name Type: String
- Named: #startPos Type: Number

"
Trait {
	#name : #FASTTNamedBehaviouralEntity,
	#traits : 'FASTTBehaviouralEntity + FASTTNamedEntity',
	#classTraits : 'FASTTBehaviouralEntity classTrait + FASTTNamedEntity classTrait',
	#category : #'FAST-Core-Model-Traits'
}

{ #category : #meta }
FASTTNamedBehaviouralEntity classSide >> annotation [

	<FMClass: #TNamedBehaviouralEntity super: #Object>
	<package: #'FAST-Core-Model'>
	<generated>
	^ self
]
