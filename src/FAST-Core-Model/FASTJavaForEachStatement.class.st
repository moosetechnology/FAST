"
A node of a for loop statement.

eg.
for(Patate p : list) {
...
}
"
Class {
	#name : #FASTJavaForEachStatement,
	#superclass : #FASTStatement,
	#instVars : [
		'body',
		'fieldname',
		'list',
		'type'
	],
	#category : #'FAST-Core-Model-Entities'
}

{ #category : #meta }
FASTJavaForEachStatement class >> annotation [

	<MSEClass: #JavaForEachStatement super: #FASTStatement>
	<package: #'FAST-Core-Model'>
	<generated>
	^self
]

{ #category : #generator }
FASTJavaForEachStatement class >> generatedSlotNames [
	<generated>
	'FASTJavaForEachStatement class>>#generatedSlotNames'.
	^ #(body fieldname list type)
]

{ #category : #generator }
FASTJavaForEachStatement class >> generatedTraitNames [
	<generated>
	^ #()
]

{ #category : #meta }
FASTJavaForEachStatement class >> requirements [

	<generated>
	^ {  }
]

{ #category : #accessing }
FASTJavaForEachStatement >> body [

	<MSEProperty: #body type: #FASTStatement>
	<generated>
	<MSEComment: 'The body of the For Each statement'>
	^ body
]

{ #category : #accessing }
FASTJavaForEachStatement >> body: anObject [

	<generated>
	body := anObject

]

{ #category : #accessing }
FASTJavaForEachStatement >> fieldname [

	<MSEProperty: #fieldname type: #FASTExpression>
	<generated>
	<MSEComment: 'The name of the created local variable'>
	^ fieldname
]

{ #category : #accessing }
FASTJavaForEachStatement >> fieldname: anObject [

	<generated>
	fieldname := anObject

]

{ #category : #accessing }
FASTJavaForEachStatement >> list [

	<MSEProperty: #list type: #FASTExpression>
	<generated>
	<MSEComment: 'The list the for each statement iterate on'>
	^ list
]

{ #category : #accessing }
FASTJavaForEachStatement >> list: anObject [

	<generated>
	list := anObject

]

{ #category : #accessing }
FASTJavaForEachStatement >> type [

	<MSEProperty: #type type: #FASTStatement>
	<generated>
	<MSEComment: 'The name of the type of the created local variable'>
	^ type
]

{ #category : #accessing }
FASTJavaForEachStatement >> type: anObject [

	<generated>
	type := anObject

]
