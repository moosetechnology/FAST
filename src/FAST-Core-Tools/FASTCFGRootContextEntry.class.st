"
I am the root context entry to represent the statement block that is given to prodiuce the CFG
"
Class {
	#name : 'FASTCFGRootContextEntry',
	#superclass : 'FASTCFGContextEntry',
	#category : 'FAST-Core-Tools-CFG',
	#package : 'FAST-Core-Tools',
	#tag : 'CFG'
}

{ #category : 'adding' }
FASTCFGRootContextEntry >> addNextBlock: aBlock [
	"Nothing to do at root."

	
]

{ #category : 'accessing' }
FASTCFGRootContextEntry >> conditional [

	^ nil
]

{ #category : 'accessing' }
FASTCFGRootContextEntry >> flushCurrentBlocks [ 
	"In the root entry we do nothing because we want to keep the info of the root blocks to set the null block if needed."
]

{ #category : 'printing' }
FASTCFGRootContextEntry >> printOn: aStream [

	super printOn: aStream.

	aStream nextPutAll: ' - Root'
]
