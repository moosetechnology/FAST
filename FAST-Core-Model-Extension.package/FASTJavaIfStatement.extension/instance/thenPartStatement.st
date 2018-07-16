*FAST-Core-Model-Extension
thenPartStatement
	<computed>
	<navigation: 'thenPart'>
	^ (self childrenNode select: [ :childNode | childNode class = FASTJavaThenPartStatement  ]) at: 1