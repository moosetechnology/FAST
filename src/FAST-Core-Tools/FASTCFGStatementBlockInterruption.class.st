"
I am an exception raised when a statement block should be interrupted.
For example, Break of Continue statement are encountered during the visit of a loop. Or if we reach a return.

 I should be caught in the visit of the statement block and my use is mostly to skip the rest of the statement block containing me.
"
Class {
	#name : 'FASTCFGStatementBlockInterruption',
	#superclass : 'Exception',
	#category : 'FAST-Core-Tools-CFG',
	#package : 'FAST-Core-Tools',
	#tag : 'CFG'
}
