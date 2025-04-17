"
Please describe the package using the class comment of the included manifest class. The manifest class also includes other additional metadata for the package. These meta data are used by other tools such as the SmalllintManifestChecker and the critics Browser
"
Class {
	#name : 'ManifestFASTModelGenerator',
	#superclass : 'PackageManifest',
	#category : 'FAST-Model-Generator-Manifest',
	#package : 'FAST-Model-Generator',
	#tag : 'Manifest'
}

{ #category : 'code-critics' }
ManifestFASTModelGenerator class >> ruleLongMethodsRuleV1FalsePositive [

	<ignoreForCoverage>
	^ #(#(#(#RGClassDefinition #(#FASTMetamodelGenerator)) #'2025-04-17T18:13:50.356175+02:00') )
]
