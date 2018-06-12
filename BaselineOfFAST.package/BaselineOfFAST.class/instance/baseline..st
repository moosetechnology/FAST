baselines
baseline: spec
	<baseline>
	spec
		for: #common
		do: [ 
			spec blessing: #baseline.
			spec description: 'Developement version of FAST using FamixNG for Pharo.'.
			spec author: 'BenoitVerhaeghe'.
			spec timestamp: '07/06/2018 00:00'.
			self defineDependencies: spec.
			self definePackages: spec.
			self defineGroups: spec ]