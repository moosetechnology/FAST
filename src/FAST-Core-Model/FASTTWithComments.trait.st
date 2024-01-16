"
For entities with comments. In FAST, they are called containers. 

## Relations
======================

### Other
- Relation: #comments Type: #FASTTComment Opposite: #container Comment: list of comments defined in the entity


"
Trait {
	#name : #FASTTWithComments,
	#instVars : [
		'#comments => FMMany type: #FASTTComment opposite: #container'
	],
	#category : #'FAST-Core-Model-Traits'
}

{ #category : #meta }
FASTTWithComments classSide >> annotation [

	<FMClass: #TWithComments super: #Object>
	<package: #'FAST-Core-Model'>
	<generated>
	^ self
]

{ #category : #adding }
FASTTWithComments >> addComment: anObject [
	<generated>
	^ self comments add: anObject
]

{ #category : #accessing }
FASTTWithComments >> comments [
	"Relation named: #comments type: #FASTTComment opposite: #container"

	<generated>
	<FMComment: 'list of comments defined in the entity'>
	<derived>
	^ comments
]

{ #category : #accessing }
FASTTWithComments >> comments: anObject [

	<generated>
	comments value: anObject
]

{ #category : #adding }
FASTTWithComments >> hasComments [
	<FMProperty: #hasComments type: #Boolean>
	<derived>
	<FMComment: 'Define if the entity has at least one comment.'>
	^ self comments isNotEmpty
]

{ #category : #adding }
FASTTWithComments >> numberOfComments [
	<FMProperty: #numberOfComments type: #Number>
	<derived>
	<FMComment: 'The number of comments in a class'>
	^ self
		lookUpPropertyNamed: #numberOfComments
		computedAs: [ self comments size
				+
					(self children asArray
						inject: 0
						into: [ :sum :el | el numberOfComments + sum ]) ]

]

{ #category : #adding }
FASTTWithComments >> numberOfComments: aNumber [
	self cacheAt: #numberOfComments put: aNumber
]

{ #category : #adding }
FASTTWithComments >> removeComment: aComment [
	self comments remove: aComment
]
