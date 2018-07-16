*FAST-Core-Model-Extension
receiver
	<computed>
	<navigation: 'receiver'>
	self flag: 'Bug same element with arguments'.
	^ (self childrenNode select: [ :childNode | childNode class isKindOf: FASTVariableExpression class ]) at: 1 