"
A node for variable name not in a expression (example: assigned variable or parameter)
"
Trait {
	#name : #FASTTVariableEntity,
	#instVars : [
		'#parameterOwner => FMOne type: #FASTTWithParameters opposite: #parameters',
		'#parentAssignmentExpression => FMOne type: #FASTTAssignment opposite: #variable'
	],
	#traits : 'FASTTNamedEntity',
	#classTraits : 'FASTTNamedEntity classTrait',
	#category : #'FAST-Core-Model-Traits'
}

{ #category : #meta }
FASTTVariableEntity classSide >> annotation [

	<FMClass: #TVariableEntity super: #Object>
	<package: #'FAST-Core-Model'>
	<generated>
	^ self
]

{ #category : #accessing }
FASTTVariableEntity >> parameterOwner [
	"Relation named: #parameterOwner type: #FASTTWithParameters opposite: #parameters"

	<generated>
	<FMComment: 'parameterOwner'>
	<container>
	^ parameterOwner
]

{ #category : #accessing }
FASTTVariableEntity >> parameterOwner: anObject [

	<generated>
	parameterOwner := anObject
]

{ #category : #navigation }
FASTTVariableEntity >> parameterOwnerGroup [
	<generated>
	<navigation: 'ParameterOwner'>
	^ MooseSpecializedGroup with: self parameterOwner
]

{ #category : #accessing }
FASTTVariableEntity >> parentAssignmentExpression [
	"Relation named: #parentAssignmentExpression type: #FASTTAssignment opposite: #variable"

	<generated>
	<FMComment: 'Optional assignment to the variable'>
	<derived>
	^ parentAssignmentExpression
]

{ #category : #accessing }
FASTTVariableEntity >> parentAssignmentExpression: anObject [

	<generated>
	parentAssignmentExpression := anObject
]
