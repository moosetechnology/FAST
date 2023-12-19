Extension { #name : #FASTTEntity }

{ #category : #'*FAST-Core-Tools' }
FASTTEntity >> addLocalUse: aFASTNode [
	(self
		attributeAt: #localUses
		ifAbsent: [ Error signal: 'missing #localUses attribute in ' , self asString ])
		add: aFASTNode
]

{ #category : #'*FAST-Core-Tools' }
FASTTEntity >> dump [

	"Generate an expression that recreates the receiver"

	^ FASTDumpVisitor visit: self
]

{ #category : #'*FAST-Core-Tools' }
FASTTEntity >> inspectionFASTDump [

	<inspectorPresentationOrder: 1.3 title: 'FASTDump'>
	^ SpCodePresenter new
		  text: (RBParser parseExpression: self dump) formattedCode;
		  beForScripting;
		  yourself
]

{ #category : #'*FAST-Core-Tools' }
FASTTEntity >> localDeclaration [
	^self
		attributeAt: #localDeclaration
		ifAbsent: [ Error signal: 'missing #localDeclaration attribute in ' , self asString ]
]

{ #category : #'*FAST-Core-Tools' }
FASTTEntity >> localDeclaration: aDeclarationNode [
	self attributeAt: #localDeclaration put: aDeclarationNode
]

{ #category : #'*FAST-Core-Tools' }
FASTTEntity >> localUses [
	^self
		attributeAt: #localUses
		ifAbsent: [ Error signal: 'missing #localUses attribute in ' , self asString ]
]

{ #category : #'*FAST-Core-Tools' }
FASTTEntity >> localUses: aCollection [
	self attributeAt: #localUses put: aCollection 
]

{ #category : #'*FAST-Core-Tools' }
FASTTEntity >> resetLocalUses [
	self attributeAt: #localUses put: OrderedCollection new
]
