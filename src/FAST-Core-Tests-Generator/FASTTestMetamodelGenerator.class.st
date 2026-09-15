Class {
	#name : 'FASTTestMetamodelGenerator',
	#superclass : 'FamixMetamodelGenerator',
	#instVars : [
		'entity',
		'class',
		'method',
		'tEntity',
		'tNamedBehaviouralEntity',
		'tNamedEntity',
		'tStatement',
		'tStatementBlock'
	],
	#category : 'FAST-Core-Tests-Generator',
	#package : 'FAST-Core-Tests-Generator'
}

{ #category : 'class initialization' }
FASTTestMetamodelGenerator class >> initialize [
	"Generate the test MM when we load the generator to not save the generated code and ensure we start from a clean state."

	self new generateWithCleaning
]

{ #category : 'accessing' }
FASTTestMetamodelGenerator class >> packageName [

	^ #'FAST-Core-Test-Model'
]

{ #category : 'accessing' }
FASTTestMetamodelGenerator class >> prefix [

	^ #FASTTest
]

{ #category : 'accessing' }
FASTTestMetamodelGenerator class >> submetamodels [

	^ { FASTMetamodelGenerator }
]

{ #category : 'definition' }
FASTTestMetamodelGenerator >> defineClasses [

	super defineClasses.

	entity := builder newClassNamed: #Entity.
	class := builder newClassNamed: #Class.
	method := builder newClassNamed: #Method
]

{ #category : 'definition' }
FASTTestMetamodelGenerator >> defineHierarchy [

	super defineHierarchy.
	entity --|> tEntity.

	class --|> entity.
	class --|> tStatementBlock.
	class --|> tNamedEntity.
	class --|> #THasImmediateSource.
	class withPrecedenceOf: #THasImmediateSource.

	method --|> tStatement.
	method --|> tNamedBehaviouralEntity
]

{ #category : 'definition' }
FASTTestMetamodelGenerator >> defineTraits [

	super defineTraits.

	tEntity := self remoteTrait: #TEntity withPrefix: #FAST.
	tNamedBehaviouralEntity := self remoteTrait: #TNamedBehaviouralEntity withPrefix: #FAST.
	tNamedEntity := self remoteTrait: #TNamedEntity withPrefix: #FAST.
	tStatement := self remoteTrait: #TStatement withPrefix: #FAST.
	tStatementBlock := self remoteTrait: #TStatementBlock withPrefix: #FAST
]
