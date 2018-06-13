baselines
defineGroups: spec
	spec
		group: 'core' with: #('FAST-Core-Model-Extension' 'FAST-Core-Model');
		group: 'model' with: #('FAST-Model-Generator' 'core');
		group: 'default' with: #('core')