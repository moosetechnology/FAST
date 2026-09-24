Extension { #name : 'FASTTCanBeLocalDeclaration' }

{ #category : '*FAST-Core-Tools' }
FASTTCanBeLocalDeclaration >> activeVersion [
	"Used for SSA"

	^ self attributeAt: #activeVersion ifAbsent: [ nil ]
]

{ #category : '*FAST-Core-Tools' }
FASTTCanBeLocalDeclaration >> activeVersion: aSSAVersion [
	"Used for SSA"

	^ self attributeAt: #activeVersion put: aSSAVersion
]

{ #category : '*FAST-Core-Tools' }
FASTTCanBeLocalDeclaration >> addLocalUse: aFASTNode [
	"Used for LocalResolver"

	(self attributeAt: #localUses ifAbsent: [ Error signal: 'missing #localUses attribute in ' , self asString ]) add: aFASTNode
]

{ #category : '*FAST-Core-Tools' }
FASTTCanBeLocalDeclaration >> allAccesses [
	"For a specific variable, I return all the read and write accesses to the variable.
	
	Note that the receiver should be a node representing a variable for it to work."

	^ self localDeclaration localUses
]

{ #category : '*FAST-Core-Tools' }
FASTTCanBeLocalDeclaration >> allReadAccesses [
	"For a specific variable, I return all the read accesses to the variable.
	
	Note that the receiver should be a node representing a variable for it to work."

	^ self localDeclaration localUses reject: [ :access | access isVariableWriteAccess ]
]

{ #category : '*FAST-Core-Tools' }
FASTTCanBeLocalDeclaration >> allWriteAccesses [
	"For a specific variable, I return all the write accesses to the variable.
	
	Note that the receiver should be a node representing a variable for it to work."

	^ self localDeclaration localUses select: [ :access | access isVariableWriteAccess ]
]

{ #category : '*FAST-Core-Tools' }
FASTTCanBeLocalDeclaration >> assignedExpressions [
	"If I am a node representing an assignment (can be a for each for example), return the expressions used for the assignment. Else return an empty collection"

	^ self explicitRequirement
]

{ #category : '*FAST-Core-Tools' }
FASTTCanBeLocalDeclaration >> assignedExpressionsMap [

	| result |
	result := Dictionary new.

	self versionWriteAccesses do: [ :access | result at: access put: access variableDeclaration assignedExpressions ].
	^ result
]

{ #category : '*FAST-Core-Tools' }
FASTTCanBeLocalDeclaration >> clearLocalUses [
	"Used for LocalResolver"

	self attributeAt: #localUses put: OrderedCollection new
]

{ #category : '*FAST-Core-Tools' }
FASTTCanBeLocalDeclaration >> hasLocalDeclaration [
	"Used for LocalResolver"

	^ self localDeclarationifPresent: [ true ] ifAbsent: [ false ]
]

{ #category : '*FAST-Core-Tools' }
FASTTCanBeLocalDeclaration >> localDeclaration [
	"Used for LocalResolver"

	^ self localDeclarationIfAbsent: [
			  self error: 'Missing #localDeclaration attribute in ' , self asString , '. It  can have multiple sources:
- The local resolution was not done (launch the local resolver visitor or the SSA visitor on your top module)
- The entity is not an entity with a definition
- There is a bug in the local resolver' ]
]

{ #category : '*FAST-Core-Tools' }
FASTTCanBeLocalDeclaration >> localDeclaration: aDeclarationNode [
	"Used for LocalResolver"

	self attributeAt: #localDeclaration put: aDeclarationNode
]

{ #category : '*FAST-Core-Tools' }
FASTTCanBeLocalDeclaration >> localDeclarationIfAbsent: aBlock [
	"Used for LocalResolver"

	^ self attributeAt: #localDeclaration ifAbsent: aBlock
]

{ #category : '*FAST-Core-Tools' }
FASTTCanBeLocalDeclaration >> localDeclarationifPresent: aBlock ifAbsent: anotherBlock [
	"Used for LocalResolver"

	^ aBlock cull: (self attributeAt: #localDeclaration ifAbsent: anotherBlock)
]

{ #category : '*FAST-Core-Tools' }
FASTTCanBeLocalDeclaration >> localUses [
	"Used for LocalResolver"

	^ self attributeAt: #localUses ifAbsent: [ Error signal: 'missing #localUses attribute in ' , self asString ]
]

{ #category : '*FAST-Core-Tools' }
FASTTCanBeLocalDeclaration >> localUses: aCollection [
	"Used for LocalResolver"

	self attributeAt: #localUses put: aCollection
]

{ #category : '*FAST-Core-Tools' }
FASTTCanBeLocalDeclaration >> newVersionNumber [
	"Used for SSA"

	^ self activeVersion
		  ifNil: [ 0 ]
		  ifNotNil: [ :active | active version + 1 ]
]

{ #category : '*FAST-Core-Tools' }
FASTTCanBeLocalDeclaration >> ssaName [
	"Used for SSA"

	^ self ssaVersion name
]

{ #category : '*FAST-Core-Tools' }
FASTTCanBeLocalDeclaration >> ssaVersion [
	"If I represent a variable and we resolved the SSA of my FAST model, I'll return the SSA version I'm linked to."

	^ self attributeAt: #ssaVersion ifAbsent: [ nil ]
]

{ #category : '*FAST-Core-Tools' }
FASTTCanBeLocalDeclaration >> ssaVersion: aSSAVersion [
	"Used for SSA"

	self attributeAt: #ssaVersion put: aSSAVersion
]

{ #category : '*FAST-Core-Tools' }
FASTTCanBeLocalDeclaration >> versionAccesses [
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
FASTTCanBeLocalDeclaration >> versionReadAccesses [
	"For a specific variable, I return all the read accesses to the current version of the variable.
	
	The current version match the current SSA version of the variable. It means that it ill ignore all read and write accesses that cannot impact the currently assigned variable (in case of assignemnts in a conditional, takes all possible versions).
	
	Note that the receiver should be a node representing a variable for it to work."

	^ self versionAccesses reject: #isVariableWriteAccess
]

{ #category : '*FAST-Core-Tools' }
FASTTCanBeLocalDeclaration >> versionWriteAccesses [
	"For a specific variable, I return all the write accesses to the current version of the variable.
	
	The current version match the current SSA version of the variable. It means that it ill ignore all read and write accesses that cannot impact the currently assigned variable (in case of assignemnts in a conditional, takes all possible versions).
	
	Note that the receiver should be a node representing a variable for it to work."

	^ self versionAccesses select: #isVariableWriteAccess
]
