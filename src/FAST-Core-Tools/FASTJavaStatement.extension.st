Extension { #name : 'FASTJavaStatement' }

{ #category : '*FAST-Core-Tools' }
FASTJavaStatement >> exportForCFG [
	"exporter puts an end-of-line after each statement.
	For the CFG we remove it"

	^super exportForCFG allButLast
]
