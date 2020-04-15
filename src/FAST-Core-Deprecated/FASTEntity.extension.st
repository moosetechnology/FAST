Extension { #name : #FASTEntity }

{ #category : #'*FAST-Core-Deprecated' }
FASTEntity >> childrenNode [
	"^ (((self class allDeclaredPropertiesIn: self metamodel) select: #isChildrenProperty thenCollect: [:childrenProperty | self perform: (childrenProperty implementingSelector)]) reject: #isNil) flattened
"

	self deprecated: 'The method #childrenNode was not good. Use children instead.' transformWith: '`@receiver childrenNode' -> '`@receiver children'.
	^ self children
]
