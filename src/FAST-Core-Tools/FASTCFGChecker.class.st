"
Checks some well-formedness rules on a CFG

- #oneStart: there is only one startBlock in the CFG
- #dead rule: All BasicBlocks in the CFG have an ancestor except the startBlock
"
Class {
	#name : 'FASTCFGChecker',
	#superclass : 'Object',
	#category : 'FAST-Core-Tools-CFG',
	#package : 'FAST-Core-Tools',
	#tag : 'CFG'
}

{ #category : 'instance creation' }
FASTCFGChecker class >> on: aCFG [

	^self new
		on: aCFG 
]

{ #category : 'instance creation' }
FASTCFGChecker >> on: aCFGVisitor [

	^self unreachableBlocks: (aCFGVisitor basicBlocks).
]

{ #category : 'instance creation' }
FASTCFGChecker >> reachableBlocks: blockCollection [
	| reachable nbPastReachables newReachables |

	nbPastReachables := 0.
	reachable := blockCollection selectAsSet: #isStart.

	newReachables := reachable.
	[nbPastReachables < reachable size]
	whileTrue: [
		nbPastReachables := reachable size.
		newReachables := (newReachables flatCollectAsSet: #nextBlocks) reject: #isNil.
		reachable addAll: newReachables
	].
	^ reachable
]

{ #category : 'instance creation' }
FASTCFGChecker >> unreachableBlocks: blockCollection [

	^ blockCollection difference: (self reachableBlocks: blockCollection)
]
