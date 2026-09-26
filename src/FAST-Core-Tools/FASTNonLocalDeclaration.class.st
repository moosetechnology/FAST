"
A ""null-object"" signaling the declaration of a 'name' was not found
"
Class {
	#name : 'FASTNonLocalDeclaration',
	#superclass : 'MooseEntity',
	#traits : 'FASTTCanBeLocalDeclaration + FamixTNamedEntity',
	#classTraits : 'FASTTCanBeLocalDeclaration classTrait + FamixTNamedEntity classTrait',
	#category : 'FAST-Core-Tools-Resolver',
	#package : 'FAST-Core-Tools',
	#tag : 'Resolver'
}

{ #category : 'meta' }
FASTNonLocalDeclaration class >> annotation [

	<FMClass: #NonLocalDeclaration super: #MooseEntity>
	<package: #'FAST-Core-Tools'>
	
]

{ #category : 'accessing' }
FASTNonLocalDeclaration >> activeVersion [
	"Used for LocalResolver"

	^ self localUses first activeVersion
]

{ #category : 'testing' }
FASTNonLocalDeclaration >> isNonLocalDeclaration [

	^true
]

{ #category : 'as yet unclassified' }
FASTNonLocalDeclaration >> localDeclarationName [
	^ self localUses anyOne localDeclarationName
]
