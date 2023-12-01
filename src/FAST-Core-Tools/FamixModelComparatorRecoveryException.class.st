"
An exception raised when two nodes differ. A condition allows to check where in the calling stack to resume checking the AST.

Upon error
- This Exception must be raised with the proper condition for recovery
- The condition is a block taking 2 parameters (`node1`, `node2`)
- The condition is then tested up in the calling stack of comparisons (`#compare:to:`)
- If the condition is true, the checking resumes at this point just have if the last comparison had succeeded.
- If the condition is false, the last comparison has failed and the checking goes up in the calling stack

Typically, the condition will check the type of `node1` and/or `node2` and resume from there.
From example, comparing if-condition could fail and the recovery would occur from the parent `FASTxxxIfStatement`.
One must be specific enough in the condition so that another ancestor does not accept to recover when it was not expected. A possible way to do this is to specify the exact file and position of the node intended
"
Class {
	#name : #FamixModelComparatorRecoveryException,
	#superclass : #Exception,
	#instVars : [
		'condition'
	],
	#category : #'FAST-Core-Tools-Validator'
}

{ #category : #accessing }
FamixModelComparatorRecoveryException >> condition [

	^ condition
]

{ #category : #accessing }
FamixModelComparatorRecoveryException >> condition: anObject [

	condition := anObject
]

{ #category : #initialization }
FamixModelComparatorRecoveryException >> initialize [
	"if no condition is specified, no recovery is possible"

	super initialize.

	condition := [ :node1 :node2 | false]
]
