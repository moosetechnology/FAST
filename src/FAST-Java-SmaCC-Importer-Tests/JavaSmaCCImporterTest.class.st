Class {
	#name : #JavaSmaCCImporterTest,
	#superclass : #TestCase,
	#instVars : [
		'model',
		'aLittleOfVariables',
		'aLittleOfVariables2',
		'ifMethod',
		'params',
		'supersimple',
		'whileWhile',
		'aLittleOfVariables3',
		'aLittleOfVariables4',
		'aLittleOfVariables5'
	],
	#category : #'FAST-Java-SmaCC-Importer-Tests'
}

{ #category : #running }
JavaSmaCCImporterTest >> assembleFastMethodFromModelByName: methodName [
	| famixMethod |
	famixMethod := model allMethods detect: [ :method | method name = methodName ].
	famixMethod sourceAnchor:
		(FAMIXSourceTextAnchor new source:
			(self perform: (#method, methodName capitalized) asSymbol )).
	famixMethod generateFAST.
	^ famixMethod fastBehaviouralEntity
	

]

{ #category : #resources }
JavaSmaCCImporterTest >> methodALittleOfVariables [
	
	^ 'int aLittleOfVariables() {
		int x = 5;	
		return x;
	}'
]

{ #category : #resources }
JavaSmaCCImporterTest >> methodALittleOfVariables2 [
	
	^ 'float aLittleOfVariables2() {
		float x = 5.5;	
		return x;
	}'
]

{ #category : #resources }
JavaSmaCCImporterTest >> methodALittleOfVariables3 [
	
	^ 'char aLittleOfVariables3() {
		char x = ''c'';	
		return x;
	}'
]

{ #category : #resources }
JavaSmaCCImporterTest >> methodALittleOfVariables4 [
	
	^ 'String aLittleOfVariables4() {
		String x = "test";	
		return x;
	}'
]

{ #category : #resources }
JavaSmaCCImporterTest >> methodALittleOfVariables5 [
	
	^ 'String aLittleOfVariables5() {
		String x = null;	
		return x;
	}'
]

{ #category : #resources }
JavaSmaCCImporterTest >> methodCastAndClassProperty [
	^ 'public void onClick(final ClickEvent event) {
	List<UnPojoMetierRHGWT> removedRowValues = new ArrayList<UnPojoMetierRHGWT>();
	removedRowValues.add(rowValue);
	((IEditableListModel)SampleCustomizableTableDefinitionRH.this.pListModel).deleteObjectModel(rowValue, true);
	SampleCustomizableTableDefinitionRH.this.editableTablelist.refreshAfterRemovingRow(removedRowValues);
}'
]

{ #category : #resources }
JavaSmaCCImporterTest >> methodFor [
	^ 'void forMethod() {
	for (int i = 0;i< 3;++i){
		i++;
	}
}'
]

{ #category : #resources }
JavaSmaCCImporterTest >> methodForEach [
	^ 'void forEachMethod() {
	for(HandlerRegistration hr: SamplePageInputsAndLabels.this.hrList) {
		hr.removeHandler();
	}
}'
]

{ #category : #resources }
JavaSmaCCImporterTest >> methodIfMethod [
	^ 'void ifMethod() {
	if (true)
		return 4 + 5;
	if (false)
		{ int x = 2;	x = x + 3; }
		else 
			return 5 + 4;
	}'
]

{ #category : #resources }
JavaSmaCCImporterTest >> methodInvocationWithClassPropertyAsReceiver [
	^ 'public void onClick(final ClickEvent event) {
	SampleCustomizableTableDefinitionRH.this.editableTablelist.refreshAfterRemovingRow(removedRowValues);
}'
]

{ #category : #resources }
JavaSmaCCImporterTest >> methodInvocationWithParamAndReceiver [
	^ 'public void onClick(ClickEvent arg0) {
		x = hello(a,b).hello2(1,2);
	}'
]

{ #category : #resources }
JavaSmaCCImporterTest >> methodInvocationWithVariableAsReceiver [
	^ 'public void onClick(final ClickEvent event) {
	editableTablelist.refreshAfterRemovingRow(removedRowValues);
}'
]

{ #category : #resources }
JavaSmaCCImporterTest >> methodParams [
	
	^ 'void params(int a, float b, double c) {
		x = a + b + c;
	}'
]

{ #category : #resources }
JavaSmaCCImporterTest >> methodSimpleVariableDeclaration [
	^ 'void forMethod() {
	int x;
}'
]

{ #category : #resources }
JavaSmaCCImporterTest >> methodSimpleVariablesDeclaration [
	^ 'void forMethod() {
	int x, y;
}'
]

{ #category : #resources }
JavaSmaCCImporterTest >> methodSupersimple [
	^ 
'boolean supersimple() {
  return true;
}
'
]

{ #category : #resources }
JavaSmaCCImporterTest >> methodTryCatch [
	^ 'void tryCatch() {
	int x;
	try {
		x = 1;
   } catch (Exception e) {
		Patate.displayError(e.getMessage());
	};
}
'
]

{ #category : #resources }
JavaSmaCCImporterTest >> methodTryCatches [
	^ 'void tryCatch() {
	int x;
	try {
		x = 1;
   }
	catch (PatateException e) {
		Patate.displayError(e.getMessage());
	} 
	catch (Exception e) {
		Patate.displayError(e.getMessage());
	};
}
'
]

{ #category : #resources }
JavaSmaCCImporterTest >> methodWhileWhile [
	
	^ 
'void whileWhile() {
  boolean a = false;	
  while (true) { 
    int b = 5;
  }
  while (4 > 5) { 
    while (false)
      a = false;
    int b = 6;
  }
  boolean b = true;
  return b;
}
'
]

{ #category : #running }
JavaSmaCCImporterTest >> parseMethod: methodName [
	^ JavaSmaCCProgramNodeImporterVisitor new parseCodeMethodString: (self perform: (#method, methodName capitalized) asSymbol ) 
]

{ #category : #running }
JavaSmaCCImporterTest >> setUp [
	
	
	self setUpMethods.

]

{ #category : #running }
JavaSmaCCImporterTest >> setUpMethods [
	"Let to subclasses for optimizing the time of exectution of the tests"
	self subclassResponsibility 
]

{ #category : #resources }
JavaSmaCCImporterTest >> wholeMSE [	
	^ '(
	(FAMIX.Method (id: 4)
		(name ''ifMethod'')
		(cyclomaticComplexity 1)
		(declaredType (ref: 30))
		(numberOfStatements 0)
		(parentType (ref: 8))
		(signature ''ifMethod()''))
	(FAMIX.LocalVariable (id: 5)
		(name ''x'')
		(declaredType (ref: 20))
		(parentBehaviouralEntity (ref: 4)))
	(FAMIX.Access (id: 6)
		(accessor (ref: 21))
		(isWrite true)
		(variable (ref: 66)))
	(FAMIX.Class (id: 8)
		(name ''DummyClass'')
		(container (ref: 36))
		(modifiers ''public''))
	(FAMIX.LocalVariable (id: 7)
		(name ''x'')
		(declaredType (ref: 41))
		(parentBehaviouralEntity (ref: 48)))
	(FAMIX.Method (id: 9)
		(name ''aLittleOfVariables'')
		(cyclomaticComplexity 1)
		(declaredType (ref: 20))
		(numberOfStatements 1)
		(parentType (ref: 8))
		(signature ''aLittleOfVariables()''))
	(FAMIX.Class (id: 10)
		(name ''Object'')
		(container (ref: 36))
		(isStub true))
	(FAMIX.Method (id: 13)
		(name ''aLittleOfVariables4'')
		(cyclomaticComplexity 1)
		(declaredType (ref: 56))
		(numberOfStatements 1)
		(parentType (ref: 8))
		(signature ''aLittleOfVariables4()''))
	(FAMIX.PrimitiveType (id: 15)
		(name ''char'')
		(isStub true))
	(FAMIX.JavaSourceLanguage (id: 16))
	(FAMIX.PrimitiveType (id: 18)
		(name ''boolean'')
		(isStub true))
	(FAMIX.Method (id: 21)
		(name ''params'')
		(cyclomaticComplexity 1)
		(declaredType (ref: 30))
		(numberOfStatements 1)
		(parentType (ref: 8))
		(signature ''params(int,float,double)''))
	(FAMIX.PrimitiveType (id: 20)
		(name ''int'')
		(isStub true))
	(FAMIX.LocalVariable (id: 25)
		(name ''x'')
		(declaredType (ref: 20))
		(parentBehaviouralEntity (ref: 9)))
	(FAMIX.Method (id: 26)
		(name ''aLittleOfVariables3'')
		(cyclomaticComplexity 1)
		(declaredType (ref: 15))
		(numberOfStatements 1)
		(parentType (ref: 8))
		(signature ''aLittleOfVariables3()''))
	(FAMIX.LocalVariable (id: 27)
		(name ''b'')
		(declaredType (ref: 20))
		(parentBehaviouralEntity (ref: 57)))
	(FAMIX.PrimitiveType (id: 30)
		(name ''void'')
		(isStub true))
	(FAMIX.PrimitiveType (id: 32)
		(name ''double'')
		(isStub true))
	(FAMIX.LocalVariable (id: 33)
		(name ''a'')
		(declaredType (ref: 18))
		(parentBehaviouralEntity (ref: 57)))
	(FAMIX.Inheritance (id: 35)
		(subclass (ref: 56))
		(superclass (ref: 10)))
	(FAMIX.Namespace (id: 36)
		(name ''<Default Package>'')
		(isStub true))
	(FAMIX.PrimitiveType (id: 41)
		(name ''float'')
		(isStub true))
	(FAMIX.Parameter (id: 42)
		(name ''a'')
		(declaredType (ref: 20))
		(parentBehaviouralEntity (ref: 21)))
	(FAMIX.LocalVariable (id: 44)
		(name ''x'')
		(declaredType (ref: 56))
		(parentBehaviouralEntity (ref: 51)))
	(FAMIX.Parameter (id: 45)
		(name ''b'')
		(declaredType (ref: 41))
		(parentBehaviouralEntity (ref: 21)))
	(FAMIX.Namespace (id: 47)
		(name ''java'')
		(isStub true))
	(FAMIX.Method (id: 48)
		(name ''aLittleOfVariables2'')
		(cyclomaticComplexity 1)
		(declaredType (ref: 41))
		(numberOfStatements 1)
		(parentType (ref: 8))
		(signature ''aLittleOfVariables2()''))
	(FAMIX.LocalVariable (id: 49)
		(name ''x'')
		(declaredType (ref: 56))
		(parentBehaviouralEntity (ref: 13)))
	(FAMIX.LocalVariable (id: 50)
		(name ''b'')
		(declaredType (ref: 20))
		(parentBehaviouralEntity (ref: 57)))
	(FAMIX.Method (id: 51)
		(name ''aLittleOfVariables5'')
		(cyclomaticComplexity 1)
		(declaredType (ref: 56))
		(numberOfStatements 1)
		(parentType (ref: 8))
		(signature ''aLittleOfVariables5()''))
	(FAMIX.Parameter (id: 52)
		(name ''c'')
		(declaredType (ref: 32))
		(parentBehaviouralEntity (ref: 21)))
	(FAMIX.Class (id: 56)
		(name ''String'')
		(container (ref: 36))
		(isStub true)
		(modifiers ''final'' ''public''))
	(FAMIX.Inheritance (id: 55)
		(subclass (ref: 8))
		(superclass (ref: 10)))
	(FAMIX.Method (id: 57)
		(name ''whileWhile'')
		(cyclomaticComplexity 4)
		(declaredType (ref: 30))
		(numberOfStatements 5)
		(parentType (ref: 8))
		(signature ''whileWhile()''))
	(FAMIX.LocalVariable (id: 60)
		(name ''b'')
		(declaredType (ref: 18))
		(parentBehaviouralEntity (ref: 57)))
	(FAMIX.LocalVariable (id: 64)
		(name ''x'')
		(declaredType (ref: 15))
		(parentBehaviouralEntity (ref: 26)))
	(FAMIX.Method (id: 63)
		(name ''supersimple'')
		(cyclomaticComplexity 1)
		(declaredType (ref: 18))
		(numberOfStatements 1)
		(parentType (ref: 8))
		(signature ''supersimple()''))
	(FAMIX.Attribute (id: 66)
		(name ''x'')
		(declaredType (ref: 20))
		(modifiers ''protected'')
		(parentType (ref: 8)))
	)'
]
