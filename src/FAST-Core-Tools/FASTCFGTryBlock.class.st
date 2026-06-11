"
I am a block defining the try block of a try catch. 

I'll associate the pattern defining the class to catch to the block to execute.

A block associated to nil is the block to execute if no exception happens (for example a finally or else or the block following).

I am special in the sense that I am the only node that do not ensure every of its statements will be executed together since an exception can happen at every statement.
"
Class {
	#name : 'FASTCFGTryBlock',
	#superclass : 'FASTCFGAbstractMultipleConditionBlock',
	#category : 'FAST-Core-Tools-CFG',
	#package : 'FAST-Core-Tools',
	#tag : 'CFG'
}

{ #category : 'testing' }
FASTCFGTryBlock >> isFull [
	"I am full when I have a branch pointing what happens if there is no exception caught and this branch has a nil pattern."

	^ blocksMap
		  at: nil
		  ifPresent: [ :value | value isNotNil ]
		  ifAbsent: [ false ]
]

{ #category : 'testing' }
FASTCFGTryBlock >> isTry [

	^ true
]
