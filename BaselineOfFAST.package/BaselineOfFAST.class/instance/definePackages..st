baselines
definePackages: spec
	spec
		repository: 'https://github.com/moosetechnology/FAST';
		package: 'FAST-Core-Model';
		package: 'FAST-Core-Model-Extension' with: [ spec requires: #('FAST-Core-Model') ];
		package: 'FAST-Model-Generator'