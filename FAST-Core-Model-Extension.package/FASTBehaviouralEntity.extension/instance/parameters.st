*FAST-Core-Model-Extension
parameters
	<computed>
	<navigation: 'parameters'>
	^ (self childrenNode select: [ :childNode | childNode class isKindOf: FASTVariableEntity class ])