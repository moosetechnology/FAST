Extension { #name : 'MooseModel' }

{ #category : '*FAST-Core-Tools' }
MooseModel >> allSSAVersions [
	"Return all SSA variable declarations"

	^ (self entities collect: #ssaVersion as: IdentitySet) reject: #isNil
]

{ #category : '*FAST-Core-Tools' }
MooseModel >> fastHighligther [
	^ FASTTextHighlighter 
]
