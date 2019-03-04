"
FASTJavaMetamodelGenerator new generate.
FASTJavaMetamodelGenerator resetMetamodel.
mooseModel := FASTMooseModel importFromMSEStream:  'D:\Developpement\mse\verveineFast\main.mse' asFileReference readStream.
"
Class {
	#name : #FASTMooseModel,
	#superclass : #MooseModel,
	#category : 'FAST-Core-Model-Extension'
}

{ #category : #accessing }
FASTMooseModel >> metamodel [
	^ metamodel ifNil: [ self class meta ]
]

{ #category : #accessing }
FASTMooseModel >> mooseDescription [

	^ self metamodel descriptionOf: MooseModel instanceSide
]
