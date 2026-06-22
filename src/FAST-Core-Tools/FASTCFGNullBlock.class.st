"
I am a node that is created if a CFG have multiple exits. In that case I am created and I follow those nodes to have only one exit point.

If the CFG already has one exit, I am not present in the graph.
"
Class {
	#name : 'FASTCFGNullBlock',
	#superclass : 'FASTCFGAbstractBlock',
	#category : 'FAST-Core-Tools-CFG',
	#package : 'FAST-Core-Tools',
	#tag : 'CFG'
}

{ #category : 'visiting' }
FASTCFGNullBlock >> accept: aVisitor [

	^ aVisitor visitCFGNullBlock: self
]

{ #category : 'adding' }
FASTCFGNullBlock >> addNextBlock: aBlock [

	self error: 'A null block cannot have a next block since it represent a virtual block merging all exit points if the exit point is not unique.'
]

{ #category : 'private' }
FASTCFGNullBlock >> endsWithBreakStatement [
	"I cannot contain a breack"

	^ false
]

{ #category : 'private' }
FASTCFGNullBlock >> endsWithContinueStatement [
	"I cannot contain a continue"

	^ false
]

{ #category : 'testing' }
FASTCFGNullBlock >> isFull [
	"I never have a next block"

	^ true
]

{ #category : 'testing' }
FASTCFGNullBlock >> isNullBlock [

	^ true
]

{ #category : 'mermaid' }
FASTCFGNullBlock >> mermaidDelimiters [

	^ '(((' -> ')))'
]

{ #category : 'accessing' }
FASTCFGNullBlock >> nextBlockForValues [

	^ {  }
]

{ #category : 'accessing' }
FASTCFGNullBlock >> nextBlocks [

	^ Array empty
]
