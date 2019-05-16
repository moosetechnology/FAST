Trait {
	#name : #TFASTImporterVisitor,
	#category : #'FAST-Core-Importer'
}

{ #category : #adding }
TFASTImporterVisitor >> addToModel: anEntity [
	self model silentlyAdd: anEntity.
	^ anEntity
]

{ #category : #accessing }
TFASTImporterVisitor >> model [
	"return a model that should be used for storing elements"
	self shouldBeImplemented
]

{ #category : #parsing }
TFASTImporterVisitor >> parseTreeForSource: methodSourceString [
	^ self parser parseMethod: methodSourceString
		onError: [:aString :pos | ^nil]
]

{ #category : #parsing }
TFASTImporterVisitor >> parser [
	"return a parser that should be used to parse source into tree"
	self shouldBeImplemented
]
