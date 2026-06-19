"
I am a block to represent a switch. 

A switch will contain as last statement the subject of the switch. 

Then I associate the statement defining the case to the block executed if we select this path.
"
Class {
	#name : 'FASTCFGSwitchBlock',
	#superclass : 'FASTCFGAbstractMultipleConditionBlock',
	#category : 'FAST-Core-Tools-CFG',
	#package : 'FAST-Core-Tools',
	#tag : 'CFG'
}

{ #category : 'adding' }
FASTCFGSwitchBlock >> addNextBlock: aBlock [
	"I either have the normal addNextBlock behaviour or I add the path where no case was validated during execution, and there is no default case."

	| lastAssociation |
	lastAssociation := blocksMap associations last.
	lastAssociation value ifNil: [ ^ super addNextBlock: aBlock ].

	self assert: (blocksMap includesKey: nil) not description: 'I should have no default case.'.

	^ blocksMap at: nil put: aBlock
]

{ #category : 'accessing' }
FASTCFGSwitchBlock >> defaultCase [

	^ blocksMap at: nil
]

{ #category : 'testing' }
FASTCFGSwitchBlock >> includesPattern: aPattern [

	^ self patterns anySatisfy: [ :pattern | pattern isSameAsCFGCasePattern: aPattern ]
]

{ #category : 'testing' }
FASTCFGSwitchBlock >> isSwitch [

	^ true
]

{ #category : 'mermaid' }
FASTCFGSwitchBlock >> mermaidDelimiters [

	^ '{{' -> '}}'
]
