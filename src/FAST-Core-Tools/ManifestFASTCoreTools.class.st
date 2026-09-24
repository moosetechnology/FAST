"
Please comment package here 
"
Class {
	#name : 'ManifestFASTCoreTools',
	#superclass : 'PackageManifest',
	#category : 'FAST-Core-Tools-Manifest',
	#package : 'FAST-Core-Tools',
	#tag : 'Manifest'
}

{ #category : 'asserting' }
ManifestFASTCoreTools class >> shouldBeIncludedByDefaultInMetamodelsWith: aCollectionOfPackages [
	"Includes in MM that are based on FAST"

	^ aCollectionOfPackages anySatisfy: [ :package | package definedClasses anySatisfy: [ :class | class = FASTTEntity ] ]
]
