*FAST-Core-Model-Extension
bodyStatement
	<computed>
	<navigation: 'body'>
	^ (self childrenNode select: [ :childNode | childNode class = FASTJavaBodyStatement class ]) at: 1