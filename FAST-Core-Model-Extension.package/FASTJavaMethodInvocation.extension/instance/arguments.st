*FAST-Core-Model-Extension
arguments
	<computed>
	<navigation: 'arguments'>
	^ (self childrenNode select: [ :childNode | childNode class isKindOf: FASTVariableExpression class ]) 