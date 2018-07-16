*FAST-Core-Model-Extension
statements
	<computed>
	<navigation: 'statements'>
	^ self childrenNode select: [ :child | child class isKindOf: FASTStatement class ]