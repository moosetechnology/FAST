Class {
	#name : #FASTEntitySourceAnchor,
	#superclass : #FASTEntity,
	#traits : 'FamixTSourceAnchor',
	#classTraits : 'FamixTSourceAnchor classTrait',
	#instVars : [
		'#startPos => FMProperty',
		'#endPos => FMProperty'
	],
	#category : #'FAST-Core-Model-Entities'
}

{ #category : #meta }
FASTEntitySourceAnchor class >> annotation [

	<FMClass: #EntitySourceAnchor super: #FASTEntity>
	<package: #'FAST-Core-Model'>
	<generated>
	^self
]

{ #category : #accessing }
FASTEntitySourceAnchor >> endPos [

	<FMProperty: #endPos type: #Number>
	<generated>
	^ endPos
]

{ #category : #accessing }
FASTEntitySourceAnchor >> endPos: anObject [
	<generated>
	endPos := anObject
]

{ #category : #accessing }
FASTEntitySourceAnchor >> startPos [

	<FMProperty: #startPos type: #Number>
	<generated>
	^ startPos
]

{ #category : #accessing }
FASTEntitySourceAnchor >> startPos: anObject [
	<generated>
	startPos := anObject
]
