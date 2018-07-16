*FAST-Core-Model-Extension
incrementorsStatement
	<computed>
	<navigation: 'incrementors'>
	^ (self childrenNode select: [ :childNode | childNode class isKindOf: FASTJavaIncrementorsStatement class ])