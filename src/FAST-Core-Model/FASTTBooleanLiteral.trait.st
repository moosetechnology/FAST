"
A boolean literal

## Relations
======================

### Parents
- Relation: #argumentOwner Type: #FASTTWithArguments Opposite: #arguments Comment: my owner
- Relation: #expressionStatementOwner Type: #FASTTExpressionStatement Opposite: #expression Comment: The expression statement that own me (if it's the case
- Relation: #returnOwner Type: #FASTTReturnStatement Opposite: #expression Comment: The return statement that own the expression (if it's the case)
### Other
- Relation: #assignedIn Type: #FASTTAssignment Opposite: #expression Comment: Optional assignment where this expression is used

## Properties
======================

- Named: #endPos Type: Number
- Named: #primitiveValue Type: String Comment: The literal itself as found in the source code. We use primitiveValue in order to override value from Object
- Named: #startPos Type: Number

"
Trait {
	#name : #FASTTBooleanLiteral,
	#traits : 'FASTTLiteral',
	#classTraits : 'FASTTLiteral classTrait',
	#category : #'FAST-Core-Model-Traits'
}

{ #category : #meta }
FASTTBooleanLiteral classSide >> annotation [

	<FMClass: #TBooleanLiteral super: #Object>
	<package: #'FAST-Core-Model'>
	<generated>
	^ self
]
