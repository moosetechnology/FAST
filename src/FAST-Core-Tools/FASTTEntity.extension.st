Extension { #name : 'FASTTEntity' }

{ #category : '*FAST-Core-Tools' }
FASTTEntity >> dump [

	"Generate an expression that recreates the receiver"

	^ FASTDumpVisitor visit: self
]

{ #category : '*FAST-Core-Tools' }
FASTTEntity >> inspectionFASTDump: aBuilder [

	<inspectorPresentationOrder: 1.3 title: 'FASTDump'>
	^ aBuilder newCode
		  text: (RBParser parseExpression: self dump) formattedCode;
		  beForScripting;
		  yourself
]

{ #category : '*FAST-Core-Tools' }
FASTTEntity >> isSameAsCFGCasePattern: aPattern [

	aPattern ifNil: [ ^ false ].

	aPattern isCollection ifTrue: [ ^ false ].

	^ self sourceCode = aPattern sourceCode
]

{ #category : '*FAST-Core-Tools' }
FASTTEntity >> isVariableDeclaration [

	^ self isVariableWriteAccess
]

{ #category : '*FAST-Core-Tools' }
FASTTEntity >> isVariableWriteAccess [
	"I am used in the LR and SSA builder to know if I represent the assignment of a variable."

	^ self variableDeclaration isNotNil
]

{ #category : '*FAST-Core-Tools' }
FASTTEntity >> variableDeclaration [
	"If I am a node representing a write access, I should return the node assigning me. Else I return nil."

	^ self explicitRequirement
]
