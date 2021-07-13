"
An abstract superclass representing an expression node of a source code.
"
Class {
	#name : #FASTExpression,
	#superclass : #FASTEntity,
	#traits : 'FASTTArgument',
	#classTraits : 'FASTTArgument classTrait',
	#instVars : [
		'#expressionStatementOwner => FMOne type: #FASTExpressionStatement opposite: #expression',
		'#returnOwner => FMOne type: #FASTReturnStatement opposite: #expression'
	],
	#category : #'FAST-Core-Model-Entities'
}
