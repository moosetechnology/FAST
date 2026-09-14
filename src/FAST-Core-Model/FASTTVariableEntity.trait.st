"
A node for variable name not in a expression (example: assigned variable or parameter)

## Relations
======================

### Parents
| Relation | Origin | Opposite | Type | Comment |
|---|
| `invokedIn` | `FASTTNamedEntity` | `invoked` | `FASTTInvocation` | Optional invocation where this name is used|
| `parameterOwner` | `FASTTVariableEntity` | `parameters` | `FASTTWithParameters` | parameterOwner|
| `parentAssignmentExpression` | `FASTTVariableEntity` | `variable` | `FASTTAssignment` | Optional assignment to the variable|


## Properties
======================

| Name | Type | Default value | Comment |
|---|
| `endPos` | `Number` | nil | |
| `name` | `String` | nil | |
| `startPos` | `Number` | nil | |

"
Trait {
	#name : 'FASTTVariableEntity',
	#instVars : [
		'#parentAssignmentExpression => FMOne type: #FASTTAssignment opposite: #variable',
		'#parameterOwner => FMOne type: #FASTTWithParameters opposite: #parameters'
	],
	#traits : 'FASTTNamedEntity',
	#classTraits : 'FASTTNamedEntity classTrait',
	#category : 'FAST-Core-Model-Traits',
	#package : 'FAST-Core-Model',
	#tag : 'Traits'
}

{ #category : 'meta' }
FASTTVariableEntity classSide >> annotation [

	<ignoreForCoverage>
	<FMClass: #TVariableEntity super: #Object>
	<package: #'FAST-Core-Model'>
	<generated>
]

{ #category : 'testing' }
FASTTVariableEntity >> isVariableEntity [

	<ignoreForCoverage>
	<generated>
	^ true
]

{ #category : 'accessing' }
FASTTVariableEntity >> parameterOwner [
	"Relation named: #parameterOwner type: #FASTTWithParameters opposite: #parameters"

	<ignoreForCoverage>
	<generated>
	<FMComment: 'parameterOwner'>
	<container>
	^ parameterOwner
]

{ #category : 'accessing' }
FASTTVariableEntity >> parameterOwner: anObject [

	<ignoreForCoverage>
	<generated>
	parameterOwner := anObject
]

{ #category : 'accessing' }
FASTTVariableEntity >> parentAssignmentExpression [
	"Relation named: #parentAssignmentExpression type: #FASTTAssignment opposite: #variable"

	<ignoreForCoverage>
	<generated>
	<FMComment: 'Optional assignment to the variable'>
	<container>
	<derived>
	^ parentAssignmentExpression
]

{ #category : 'accessing' }
FASTTVariableEntity >> parentAssignmentExpression: anObject [

	<ignoreForCoverage>
	<generated>
	parentAssignmentExpression := anObject
]
