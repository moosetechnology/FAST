Class {
	#name : #JavaSmaCCCClassPropertyTest,
	#superclass : #JavaSmaCCImporterTest,
	#instVars : [
		'methodCastAndClassProperty'
	],
	#category : #'FAST-Java-SmaCC-Importer-Tests'
}

{ #category : #accessing }
JavaSmaCCCClassPropertyTest >> methodCastAndClassProperty [
	^ 'public void onClick(final ClickEvent event) {
	List<UnPojoMetierRHGWT> removedRowValues = new ArrayList<UnPojoMetierRHGWT>();
	removedRowValues.add(rowValue);
	((IEditableListModel)SampleCustomizableTableDefinitionRH.this.pListModel).deleteObjectModel(rowValue, true);
	SampleCustomizableTableDefinitionRH.this.editableTablelist.refreshAfterRemovingRow(removedRowValues);
}'
]

{ #category : #running }
JavaSmaCCCClassPropertyTest >> setUpMethods [
	methodCastAndClassProperty := (self parseMethod: 'CastAndClassProperty')
		allFASTJavaMethodEntity first
]

{ #category : #tests }
JavaSmaCCCClassPropertyTest >> testClassPropertyName [
	self
		assert: methodCastAndClassProperty statements fourth childrenNode first receiver fieldName
		equals: 'editableTablelist'
]

{ #category : #tests }
JavaSmaCCCClassPropertyTest >> testClassPropertyType [
	self
		assert: methodCastAndClassProperty statements fourth childrenNode first receiver class
		equals: FASTJavaClassProperty.

]
