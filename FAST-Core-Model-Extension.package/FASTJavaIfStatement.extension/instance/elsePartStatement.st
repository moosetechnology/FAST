*FAST-Core-Model-Extension
elsePartStatement
	<computed>
	<navigation: 'elsePart'>
	^ (self childrenNode select: [ :childNode | childNode class = FASTJavaElsePartStatement  ]) at: 1