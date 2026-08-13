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
FASTTEntity >> allAccesses [
	"For a specific variable, I return all the read and write accesses to the variable.
	
	Note that the receiver should be a node representing a variable for it to work."

	^ self localDeclaration localUses
]

{ #category : '*FAST-Core-Tools' }
FASTTEntity >> allReadAccesses [
	"For a specific variable, I return all the read accesses to the variable.
	
	Note that the receiver should be a node representing a variable for it to work."

	^ self localDeclaration localUses reject: [ :access | access isVariableWriteAccess ]
]

{ #category : '*FAST-Core-Tools' }
FASTTEntity >> allWriteAccesses [
	"For a specific variable, I return all the write accesses to the variable.
	
	Note that the receiver should be a node representing a variable for it to work."

	^ self localDeclaration localUses select: [ :access | access isVariableWriteAccess ]
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

	^ self localDeclarationifPresent: [ true ] ifAbsent: [ false ]
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

	^ self localDeclarationIfAbsent: [
			  self error: 'Missing #localDeclaration attribute in ' , self asString , '. It  can have multiple sources:
- The local resolution was not done (launch the local resolver visitor or the SSA visitor on your top module)
- The entity is not an entity with a definition
- There is a bug in the local resolver' ]
]

{ #category : '*FAST-Core-Tools' }
FASTTEntity >> localDeclaration: aDeclarationNode [
	"Used for LocalResolver"

	self attributeAt: #localDeclaration put: aDeclarationNode
]

{ #category : '*FAST-Core-Tools' }
FASTTEntity >> localDeclarationIfAbsent: aBlock [
	"Used for LocalResolver"

	^ self attributeAt: #localDeclaration ifAbsent: aBlock
]

{ #category : '*FAST-Core-Tools' }
FASTTEntity >> localDeclarationifPresent: aBlock ifAbsent: anotherBlock [
	"Used for LocalResolver"

	^ aBlock cull: (self attributeAt: #localDeclaration ifAbsent: anotherBlock)
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
FASTTEntity >> versionAccesses [
	"For a specific variable, I return all the read and write accesses to the current version of the variable.
	
	The current version match the current SSA version of the variable. It means that it ill ignore all read and write accesses that cannot impact the currently assigned variable (in case of assignemnts in a conditional, takes all possible versions).
	
	Note that the receiver should be a node representing a variable for it to work."

	^ self ssaVersion
		  ifNil: [
				  self error: 'No SSA version available. Possible sources:
	- You did not run the SSA resolver
	- Your node is not representing a variable
	- There is a bug in the SSA or Local resolver' ]
		  ifNotNil: [ :version | version localUses ]
]

{ #category : '*FAST-Core-Tools' }
FASTTEntity >> versionReadAccesses [
	"For a specific variable, I return all the read accesses to the current version of the variable.
	
	The current version match the current SSA version of the variable. It means that it ill ignore all read and write accesses that cannot impact the currently assigned variable (in case of assignemnts in a conditional, takes all possible versions).
	
	Note that the receiver should be a node representing a variable for it to work."

	^ self versionAccesses reject: #isVariableWriteAccess
]

{ #category : '*FAST-Core-Tools' }
FASTTEntity >> versionWriteAccesses [
	"For a specific variable, I return all the write accesses to the current version of the variable.
	
	The current version match the current SSA version of the variable. It means that it ill ignore all read and write accesses that cannot impact the currently assigned variable (in case of assignemnts in a conditional, takes all possible versions).
	
	Note that the receiver should be a node representing a variable for it to work."

	^ self versionAccesses select: #isVariableWriteAccess
]
