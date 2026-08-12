Extension { #name : 'FASTTEntity' }

{ #category : '*FAST-Core-Tools' }
FASTTEntity >> activeVersion [
	"Used for SSA"

	^ self attributeAt: #activeVersion ifAbsent: [ nil ]
]

{ #category : '*FAST-Core-Tools' }
FASTTEntity >> activeVersion: aSSAVersion [
	"Used for SSA"

	^ self attributeAt: #activeVersion put: aSSAVersion
]

{ #category : '*FAST-Core-Tools' }
FASTTEntity >> addLocalUse: aFASTNode [
	"Used for LocalResolver"

	(self attributeAt: #localUses ifAbsent: [ Error signal: 'missing #localUses attribute in ' , self asString ]) add: aFASTNode
]

{ #category : '*FAST-Core-Tools' }
FASTTEntity >> clearLocalUses [
	"Used for LocalResolver"

	self attributeAt: #localUses put: OrderedCollection new
]

{ #category : '*FAST-Core-Tools' }
FASTTEntity >> dump [

	"Generate an expression that recreates the receiver"

	^ FASTDumpVisitor visit: self
]

{ #category : '*FAST-Core-Tools' }
FASTTEntity >> hasLocalDeclaration [
	"Used for LocalResolver"

	self attributeAt: #localDeclaration ifAbsent: [ ^ false ].

	^ true
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
FASTTEntity >> isVariableWriteAccess [
	"I should be implemented in order to have the SSA working well. I should return false for most nodes, and return true if I represent a node that is a write access for a variable."

	^ self explicitRequirement
]

{ #category : '*FAST-Core-Tools' }
FASTTEntity >> localDeclaration [
	"Used for LocalResolver"

	^ self attributeAt: #localDeclaration ifAbsent: [ Error signal: 'missing #localDeclaration attribute in ' , self asString ]
]

{ #category : '*FAST-Core-Tools' }
FASTTEntity >> localDeclaration: aDeclarationNode [
	"Used for LocalResolver"

	self attributeAt: #localDeclaration put: aDeclarationNode
]

{ #category : '*FAST-Core-Tools' }
FASTTEntity >> localUses [
	"Used for LocalResolver"

	^ self attributeAt: #localUses ifAbsent: [ Error signal: 'missing #localUses attribute in ' , self asString ]
]

{ #category : '*FAST-Core-Tools' }
FASTTEntity >> localUses: aCollection [
	"Used for LocalResolver"

	self attributeAt: #localUses put: aCollection
]

{ #category : '*FAST-Core-Tools' }
FASTTEntity >> newVersionNumber [
	"Used for SSA"

	^ self activeVersion
		  ifNil: [ 0 ]
		  ifNotNil: [ :active | active version + 1 ]
]

{ #category : '*FAST-Core-Tools' }
FASTTEntity >> readAccesses [

	| uses |
	uses := self attributeAt: #localUses ifAbsent: [ Error signal: 'No local resolution done.' ].

	^ uses reject: #isVariableWriteAccess
]

{ #category : '*FAST-Core-Tools' }
FASTTEntity >> ssaName [
	"Used for SSA"

	^ self ssaVersion name
]

{ #category : '*FAST-Core-Tools' }
FASTTEntity >> ssaVersion [
	"If I represent a variable and we resolved the SSA of my FAST model, I'll return the SSA version I'm linked to."

	^ self attributeAt: #ssaVersion ifAbsent: [ nil ]
]

{ #category : '*FAST-Core-Tools' }
FASTTEntity >> ssaVersion: aSSAVersion [
	"Used for SSA"

	self attributeAt: #ssaVersion put: aSSAVersion
]

{ #category : '*FAST-Core-Tools' }
FASTTEntity >> writeAccesses [

	| uses |
	uses := self attributeAt: #localUses ifAbsent: [ Error signal: 'No local resolution done.' ].

	^ uses select: #isVariableWriteAccess
]
