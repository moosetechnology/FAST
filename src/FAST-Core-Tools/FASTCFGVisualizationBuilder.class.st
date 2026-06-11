"
I am an utility to visualize a CFG graph as a visualization. 

I'll display info such as:
- The start block
- The final block
- The code of each block
- The value of the edges
- ...
"
Class {
	#name : 'FASTCFGVisualizationBuilder',
	#superclass : 'Object',
	#instVars : [
		'canvas'
	],
	#category : 'FAST-Core-Tools-CFG',
	#package : 'FAST-Core-Tools',
	#tag : 'CFG'
}

{ #category : 'instance creation' }
FASTCFGVisualizationBuilder class >> on: aStartBlock [

	^ self new openOn: aStartBlock
]

{ #category : 'instance creation' }
FASTCFGVisualizationBuilder >> attachLineText: lineShape [

	lineShape model key nextBlockForValues do: [ :valueNextBlock |
			| label |
			valueNextBlock value = lineShape model value ifTrue: [
					label := RSLabel new text: valueNextBlock key asString.
					RSLocation new
						center;
						stick: label on: lineShape.
					canvas add: label ] ]
]

{ #category : 'hooks' }
FASTCFGVisualizationBuilder >> basicBlockShape: aBasicBlock [

	| shape |
	shape := aBasicBlock isStart
		         ifTrue: [
				         aBasicBlock isFinal
					         ifTrue: [ self startAndFinalBlockShape ]
					         ifFalse: [ self startBlockShape ] ]
		         ifFalse: [
				         aBasicBlock isFinal
					         ifTrue: [ self finalBlockShape ]
					         ifFalse: [ self normalBlockShape ] ].
	aBasicBlock isConditional ifTrue: [ shape color: self conditionalBlockColor ].
	aBasicBlock isNullBlock ifTrue: [ shape color: self nullBlockColor ].
	^ shape
]

{ #category : 'instance creation' }
FASTCFGVisualizationBuilder >> buildLegend [

	| legend |
	legend := RSLegend new.
	legend container: canvas.
	legend onDemand.
	legend title: 'Legend'.
	legend text: 'Start block' withShape: self startBlockShape.
	legend text: 'Final block' withShape: self finalBlockShape.
	legend text: 'start & final block' withShape: self startAndFinalBlockShape.
	legend text: 'Normal block' withShape: self normalBlockShape.
	legend text: 'Conditional block' withShape: (self normalBlockShape color: self conditionalBlockColor).
	legend text: 'Null block' withShape: (self normalBlockShape color: self nullBlockColor).
	legend build
]

{ #category : 'instance creation' }
FASTCFGVisualizationBuilder >> buildLines: shapes [ 

	| marker bldr |
	marker := RSArrowedLine new defaultHead.

	bldr := RSLineBuilder arrowedLine.
	bldr
		verticalBezier ;  "Bezier lines"
		markerEnd: marker ;  "Bezier lines"
		withBorderAttachPoint;
		shapes: shapes;
		canvas: canvas;
		connectToAll: [ :block | block nextBlocks ].
	
	bldr shape markerMid: (RSLabel new text: 'true').

	canvas lines do: [ :lineModel |
		lineModel model key isConditional
		ifTrue: [ self attachLineText: lineModel ] ]
]

{ #category : 'hooks' }
FASTCFGVisualizationBuilder >> conditionalBlockColor [

	^ Color blue
]

{ #category : 'hooks' }
FASTCFGVisualizationBuilder >> finalBlockShape [

	^ RSEllipse new
		  radius: 10;
		  color: Color transparent;
		  border: (RSBorder new
				   width: 4;
				   color: Color black;
				   yourself);
		  yourself
]

{ #category : 'hooks' }
FASTCFGVisualizationBuilder >> normalBlockShape [

	^ RSBox new
		  size: 20;
		  yourself
]

{ #category : 'hooks' }
FASTCFGVisualizationBuilder >> nullBlockColor [

	^ Color green
]

{ #category : 'instance creation' }
FASTCFGVisualizationBuilder >> openOn: aCFGNode [

	| shapes |
	canvas := RSCanvas new.
	shapes := aCFGNode withAllFollowingBlocks collect: [ :bb | self shapeFor: bb ].

	self buildLines: shapes.

	canvas addAll: shapes.
	[
		RSTreeLayout new
			horizontalGap: 100;
			verticalGap: 50;
			isLayered: true;
			applyOn: shapes ] valueWithin: 5 seconds onTimeout: [ self inform: 'Tree layout computation takes too long. Aborted' ].

	self buildLegend.

	canvas @ RSCanvasController new noLegend.

	^ canvas
]

{ #category : 'hooks' }
FASTCFGVisualizationBuilder >> shapeFor: aBasicBlock [

	| shape |
	shape := self basicBlockShape: aBasicBlock.

	shape model: aBasicBlock.
	shape @ (RSPopup text: [ :block | block sourceCode ]).
	shape @ RSDraggable.

	^ shape
]

{ #category : 'hooks' }
FASTCFGVisualizationBuilder >> startAndFinalBlockShape [

	^ RSComposite new
		  add: self finalBlockShape;
		  add: (RSEllipse new
				   radius: 5;
				   color: Color black;
				   yourself);
		  adjustToChildren;
		  yourself
]

{ #category : 'hooks' }
FASTCFGVisualizationBuilder >> startBlockShape [

	^ RSEllipse new
		  radius: 10;
		  color: Color black;
		  yourself
]
