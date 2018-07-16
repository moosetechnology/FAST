*FAST-Core-Model-Extension
initializersStatement
	<computed>
	<navigation: 'initializers'>
	^ (self childrenNode select: [ :childNode | childNode class isKindOf: FASTJavaInitializersStatement class ]) 