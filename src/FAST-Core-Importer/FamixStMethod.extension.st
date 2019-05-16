Extension { #name : #FamixStMethod }

{ #category : #'*FAST-Core-Importer' }
FamixStMethod >> generateFAST [
	<menuItem: 'Generate FAST'>
	
		| visitorClass visitor |
		visitorClass := FASTSmalltalkImporterVisitor.
		visitor := visitorClass newWithModel: self mooseModel.
		visitor runWithSource: self sourceText and: self
]
