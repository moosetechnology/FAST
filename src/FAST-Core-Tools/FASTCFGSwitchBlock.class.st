"
I am a block to represent a switch. 

A switch will contain as last statement the subject of the switch. 

Then I associate the statement defining the case to the block executed if we select this path.
"
Class {
	#name : 'FASTCFGSwitchBlock',
	#superclass : 'FASTCFGAbstractMultipleConditionBlock',
	#instVars : [
		'isFull'
	],
	#category : 'FAST-Core-Tools-CFG',
	#package : 'FAST-Core-Tools',
	#tag : 'CFG'
}

{ #category : 'visiting' }
FASTCFGSwitchBlock >> accept: aVisitor [

	^ aVisitor visitCFGSwitchBlock: self
]

{ #category : 'accessing' }
FASTCFGSwitchBlock >> defaultCase [

	^ blocksMap at: nil
]

{ #category : 'testing' }
FASTCFGSwitchBlock >> includesPattern: aPattern [

	^ self patterns anySatisfy: [ :pattern | pattern isSameAsCFGCasePattern: aPattern ]
]

{ #category : 'initialization' }
FASTCFGSwitchBlock >> initialize [

	super initialize.
	isFull := false
]

{ #category : 'accessing' }
FASTCFGSwitchBlock >> isFull [
	"In the case of a switch, we cannot know with just the node so the algo will tell us when it is full at the closing of the switch.."

	^ isFull
]

{ #category : 'accessing' }
FASTCFGSwitchBlock >> isFull: anObject [
	isFull := anObject
]

{ #category : 'testing' }
FASTCFGSwitchBlock >> isSwitch [

	^ true
]

{ #category : 'mermaid' }
FASTCFGSwitchBlock >> mermaidDelimiters [

	^ '{{' -> '}}'
]
