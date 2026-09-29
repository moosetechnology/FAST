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

	self localUses add: aFASTNode
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

	self localUses removeAll
]

{ #category : '*FAST-Core-Tools' }
FASTTCanBeLocalDeclaration >> hasLocalDeclaration [
	"Used for LocalResolver"

	^ self localDeclarationifPresent: [ true ] ifAbsent: [ false ]
]

{ #category : '*FAST-Core-Tools' }
FASTTCanBeLocalDeclaration >> localDeclaration [
	"Used for LocalResolver"

	<FMProperty: #localDeclaration type: #FASTTCanBeLocalDeclaration opposite: #localUses>
	<FMComment:
	'Return the local declaration for this node. The local declaration is the declaration of a named entity I represent. In languages without declarations, return the first occurence of the entity. This requires the local resolution to work.'>
	^ self attributeAt: #localDeclaration ifAbsent: [ nil ]
]

{ #category : '*FAST-Core-Tools' }
FASTTCanBeLocalDeclaration >> localDeclaration: aDeclarationNode [
	"Used for LocalResolver"

	self attributeAt: #localDeclaration put: (FMMultivalueLink
			 on: self
			 update: #localUses
			 from: (self localDeclarationIfAbsent: [ nil ])
			 to: aDeclarationNode)
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

	<FMProperty: #localUses type: #FASTTCanBeLocalDeclaration opposite: #localDeclaration>
	<multivalued>
	<FMComment:
	'If I represent the local declaration of an entity, return all nodes representing the usage of the entity I represent. This requires the local resolution to work'>
	^ self attributeAt: #localUses ifAbsentPut: [ FMMultivalueLink on: self opposite: #localDeclaration: ]
]

{ #category : '*FAST-Core-Tools' }
FASTTCanBeLocalDeclaration >> localUses: aCollection [
	"Used for LocalResolver"

	self localUses value: aCollection
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

	<FMProperty: #ssaVersion type: #FASTAbstractVariableVersionSSA>
	<FMComment: 'If I represent a variable and we resolved the SSA of my FAST model, I''ll return the SSA version I''m linked to.'>
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
