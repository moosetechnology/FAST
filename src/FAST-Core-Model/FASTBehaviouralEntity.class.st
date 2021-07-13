"
Represents a generic behavioural entity which has parameters and local variables, as well as statements. 

Can represent a SmalltalkBlock, or a JavaLambda
Subclassed for NamedBehavioural as methods/functions

Has parameters , and a body (StatementBlock).
Local variables are intended to be stored in the local entities of the body
"
Class {
	#name : #FASTBehaviouralEntity,
	#superclass : #FASTScopableEntity,
	#traits : 'FASTTWithParameters',
	#classTraits : 'FASTTWithParameters classTrait',
	#instVars : [
		'#statementBlock => FMOne type: #FASTStatementBlock opposite: #fastBehaviouralParent'
	],
	#category : #'FAST-Core-Model-Entities'
}
