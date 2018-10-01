Extension { #name : #FAMIXMethod }

{ #category : #'*FAST-Java-Importer' }
FAMIXMethod >> generateFAST [
	<menuItem: 'Generate FAST'>
	self fastBehaviouralEntity ifNil: [
		| visitorClass visitor |
		self sourceLanguage isSmalltalk ifTrue: [visitorClass := FASTSmalltalkImporterVisitor].
		self sourceLanguage isJava ifTrue: [visitorClass := FASTJavaImporterVisitor]. 
		visitor := visitorClass newWithModel: self mooseModel.
		visitor runWithSource: self sourceText and: self]
]
