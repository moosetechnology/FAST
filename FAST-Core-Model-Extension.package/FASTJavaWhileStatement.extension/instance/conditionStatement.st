*FAST-Core-Model-Extension
conditionStatement
	<computed>
	<navigation: 'condition'>
	^ (self childrenNode select: [ :childNode | childNode class isKindOf: FASTJavaConditionStatement class ]) at: 1