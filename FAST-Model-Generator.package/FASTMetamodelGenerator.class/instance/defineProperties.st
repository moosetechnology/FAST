definition
defineProperties
   self flag: 'v. commentaire dans #defineNewClassesHierarchy'.
	(variableEntity property: #variableName type: #String) comment: 'Name of a variable'.
	(namedBehaviouralEntity property: #behaviouralName type: #String) comment: 'Name of the behavioural entity'.

   self flag: 'devrait etre aussi #TNamed'.
	(variableExpression property: #variableName type: #String) comment: 'Name of a variable'.
	(literal property: #value type: #String) comment: 'The literal itself as found in the source code'