"
A node representing method imvocation
"
Class {
	#name : #FASTJavaMethodInvocation,
	#superclass : #FASTExpression,
	#traits : 'FamixTNamed',
	#classTraits : 'FamixTNamed classTrait',
	#instVars : [
		'receiver'
	],
	#category : #'FAST-Core-Model-Entities'
}

{ #category : #meta }
FASTJavaMethodInvocation class >> annotation [

	<MSEClass: #JavaMethodInvocation super: #FASTExpression>
	<package: #'FAST-Core-Model'>
	<generated>
	^self
]

{ #category : #generator }
FASTJavaMethodInvocation class >> generatedSlotNames [
	<generated>
	'FASTJavaMethodInvocation class>>#generatedSlotNames'.
	^ #(receiver)
]

{ #category : #generator }
FASTJavaMethodInvocation class >> generatedTraitNames [
	<generated>
	^ #(FamixTNamed)
]

{ #category : #meta }
FASTJavaMethodInvocation class >> requirements [

	<generated>
	^ {  }
]

{ #category : #accessing }
FASTJavaMethodInvocation >> receiver [

	<MSEProperty: #receiver type: #FASTExpression>
	<generated>
	<MSEComment: 'The expression whitch will execute this invocation'>
	^ receiver
]

{ #category : #accessing }
FASTJavaMethodInvocation >> receiver: anObject [

	<generated>
	receiver := anObject

]
