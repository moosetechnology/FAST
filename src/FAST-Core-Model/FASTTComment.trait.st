"
FASTComment represents one instance of a comment (in the sense of programming language comments) for any FAST sourced entity. The commented sourced entity is called the container in the FAST model.

## Relations
======================

### Other
- Relation: #container Type: #FASTTWithComments Opposite: #comments Comment: Source code entity containing the comment

## Properties
======================

- Named: #content Type: String Comment: Content of the comment as a String

"
Trait {
	#name : #FASTTComment,
	#instVars : [
		'#content => FMProperty',
		'#container => FMOne type: #FASTTWithComments opposite: #comments'
	],
	#category : #'FAST-Core-Model-Traits'
}

{ #category : #meta }
FASTTComment classSide >> annotation [

	<FMClass: #TComment super: #Object>
	<package: #'FAST-Core-Model'>
	<generated>
	^ self
]

{ #category : #accessing }
FASTTComment >> container [
	"Relation named: #container type: #FASTTWithComments opposite: #comments"

	<generated>
	<FMComment: 'Source code entity containing the comment'>
	^ container
]

{ #category : #accessing }
FASTTComment >> container: anObject [

	<generated>
	container := anObject
]

{ #category : #accessing }
FASTTComment >> content [

	<FMProperty: #content type: #String>
	<generated>
	<FMComment: 'Content of the comment as a String'>
	^ content
]

{ #category : #accessing }
FASTTComment >> content: anObject [
	<generated>
	content := anObject
]
