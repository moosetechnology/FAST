definition
newBuilder
	^ FamixGenerator builderWithDefinitions
		doNotGenerateCurrent;
		generator: self;
		yourself