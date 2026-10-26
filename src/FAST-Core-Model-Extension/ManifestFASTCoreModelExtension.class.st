Class {
	#name : 'ManifestFASTCoreModelExtension',
	#superclass : 'PackageManifest',
	#category : 'FAST-Core-Model-Extension-Manifest',
	#package : 'FAST-Core-Model-Extension',
	#tag : 'Manifest'
}

{ #category : 'asserting' }
ManifestFASTCoreModelExtension class >> shouldBeIncludedByDefaultInMetamodelsWith: aCollectionOfPackages [
	"Includes in MM that are based on FAST"

	^ aCollectionOfPackages anySatisfy: [ :package | package definedClasses anySatisfy: [ :class | class = FASTTEntity ] ]
]
