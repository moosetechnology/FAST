Class {
	#name : #FASTMooseModel,
	#superclass : #MooseModel,
	#category : #'FAST-Core-Model'
}

{ #category : #initialization }
FASTMooseModel >> initialize [
		<generated>
		super initialize.
		self metamodel: (self class environment at: #FASTMetamodelGenerator) metamodel
]
