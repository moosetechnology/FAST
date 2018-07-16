*FAST-Core-Model-Extension
conditionStatement
	<computed>
	<navigation: 'condition'>
	^ (self childrenNode select: [ :childNode | childNode class = FASTJavaConditionStatement ]) at: 1