"
This class provides different methods to calculate eccentricity of a graph.
"
Class {
	#name : #NetworkEccentricity,
	#superclass : #Object,
	#category : #'ComplexNetwork-DistanceMeasures'
}

{ #category : #'as yet unclassified' }
NetworkEccentricity >> findEccentricity: aGraph node: aNode [

	| distance queue node eccentricity |
	distance := OrderedCollection new.
	1 to: aGraph nodes size do: [ :index | distance add: -1 ].
	distance at: aNode id put: 0.

	queue := LinkedList new.
	queue addLast: aNode.

	[ queue isNotEmpty ] whileTrue: [
		node := queue removeFirst.
		node adjacentNodes do: [ :currentNode |
			(distance at: currentNode id) = -1 ifTrue: [
				distance at: currentNode id put: (distance at: node id) + 1.
				queue addLast: currentNode ] ] ].
	eccentricity := distance max.
	eccentricity = 0 ifTrue: [ eccentricity := Float infinity ].
	^ eccentricity
]

{ #category : #'as yet unclassified' }
NetworkEccentricity >> findEccentricityAll: aGraph [

	| eccentricities |
	eccentricities := aGraph nodes collect: [ :node |
		                  self findEccentricity: aGraph node: node ].

	^ eccentricities
]

{ #category : #'as yet unclassified' }
NetworkEccentricity >> findEccentricityById: aGraph id: anId [

	| eccentricity node |
	node := aGraph findNode: anId.
	eccentricity := self findEccentricity: aGraph node: node.

	^ eccentricity
]
