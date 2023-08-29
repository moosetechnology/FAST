Extension { #name : #FASTEntity }

{ #category : #'*FAST-Core-Tools' }
FASTEntity >> addLocalUse: aFASTNode [
	(self
		attributeAt: #localUses
		ifAbsent: [ Error signal: 'missing #localUses attribute in ' , self asString ])
		add: aFASTNode
]

{ #category : #'*FAST-Core-Tools' }
FASTEntity >> localDeclaration [
	^self
		attributeAt: #localDeclaration
		ifAbsent: [ Error signal: 'missing #localDeclaration attribute in ' , self asString ]
]

{ #category : #'*FAST-Core-Tools' }
FASTEntity >> localDeclaration: aDeclarationNode [
	self attributeAt: #localDeclaration put: aDeclarationNode
]

{ #category : #'*FAST-Core-Tools' }
FASTEntity >> localUses [
	^self
		attributeAt: #localUses
		ifAbsent: [ Error signal: 'missing #localUses attribute in ' , self asString ]
]

{ #category : #'*FAST-Core-Tools' }
FASTEntity >> localUses: aCollection [
	self attributeAt: #localUses put: aCollection 
]

{ #category : #'*FAST-Core-Tools' }
FASTEntity >> resetLocalUses [
	self attributeAt: #localUses put: OrderedCollection new
]
