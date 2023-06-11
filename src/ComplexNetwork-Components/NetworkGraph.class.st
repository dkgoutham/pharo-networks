"
Graph layout for networks
"
Class {
	#name : #NetworkGraph,
	#superclass : #Object,
	#instVars : [
		'nodes',
		'edges',
		'sortingBlock',
		'directed'
	],
	#category : #'ComplexNetwork-Components'
}

{ #category : #testing }
NetworkGraph class >> isAbstract [

	^ self = AIGraphAlgorithm
]

{ #category : #adding }
NetworkGraph >> addDirectedEdge: fromId to: toId [

	| edge sourceNode targetNode |
	sourceNode := self findNode: fromId ifAbsent: [ ^ nil ].
	targetNode := self findNode: toId ifAbsent: [ ^ nil ].

	^ self edgeClass
		  ifNil: [
			  sourceNode to: targetNode.
			  targetNode from: sourceNode.
			  nil ]
		  ifNotNil: [
			  edge := self edgeClass new.
			  edge model: {
					  sourceNode.
					  targetNode }.
			  edge from: sourceNode.
			  edge to: targetNode.
			  sourceNode to: targetNode edge: edge.
			  targetNode from: sourceNode edge: edge.
			  self edges add: edge.
			  edge ]
]

{ #category : #'building - graph' }
NetworkGraph >> addNodeFor: anId [

	^ self
		  findNode: anId
		  ifAbsent: [ nodes add: (self nodeClass with: anId) ]
]

{ #category : #adding }
NetworkGraph >> addUndirectedEdge: fromId to: toId [

	| edge sourceNode targetNode |
	sourceNode := self findNode: fromId ifAbsent: [ ^ nil ].
	targetNode := self findNode: toId ifAbsent: [ ^ nil ].

	^ self edgeClass
		  ifNil: [
			  sourceNode to: targetNode.
			  targetNode from: sourceNode.
			  nil ]
		  ifNotNil: [
			  edge := self edgeClass new.
			  edge model: {
					  sourceNode.
					  targetNode }.
			  edge node1: sourceNode.
			  edge node2: targetNode.
			  sourceNode to: targetNode edge: edge.
			  targetNode to: sourceNode edge: edge.
			  self edges add: edge.
			  edge ]
]

{ #category : #accessing }
NetworkGraph >> directed [

	^ directed
]

{ #category : #accessing }
NetworkGraph >> directed: aBoolean [

	directed := aBoolean
]

{ #category : #configuration }
NetworkGraph >> edgeClass [

	directed ifTrue: [ ^ NetworkDirectedEdge ].
	^ NetworkUndirectedEdge
]

{ #category : #accessing }
NetworkGraph >> edges [

	^ edges
]

{ #category : #'building - graph' }
NetworkGraph >> emptyGraph [

	edges := edges copyEmpty.
	nodes := nodes copyEmpty
]

{ #category : #accessing }
NetworkGraph >> findEdge: aModel [

	"^ edges findBinary: (self findBinaryBlock: aModel)"

	^ edges detect: [ :edge | edge model = aModel ]
]

{ #category : #accessing }
NetworkGraph >> findNode: anId [
	"^ nodes findBinary: (self findBinaryBlock: aModel)."

	^ nodes detect: [ :node | node id = anId ]
]

{ #category : #accessing }
NetworkGraph >> findNode: anId ifAbsent: aBlock [
	"^ nodes findBinary: (self findBinaryBlock: aModel) ifNone: aBlock"

	^ nodes detect: [ :node | node id = anId ] ifNone: aBlock
]

{ #category : #accessing }
NetworkGraph >> findNode: anId ifFound: aBlock [
	"^ nodes
		  findBinary: (self findBinaryBlock: aModel)
		  do: aBlock
		  ifNone: [  ]"

	^ nodes detect: [ :aNode | aNode id = anId ] ifFound: aBlock
]

{ #category : #accessing }
NetworkGraph >> graph [

	^ {  nodes. edges }
]

{ #category : #initialization }
NetworkGraph >> initialize [

	sortingBlock := [ :a :b | a id hash <= b id hash ].
	nodes := SortedCollection sortUsing: sortingBlock.
	edges := OrderedCollection new.
	directed := false
]

{ #category : #configuration }
NetworkGraph >> nodeClass [

	^ NetworkNode
]

{ #category : #accessing }
NetworkGraph >> nodes [

	^ nodes
]

{ #category : #'building - graph' }
NetworkGraph >> nodes: aNodeList [

	aNodeList do: [ :model | self addNodeFor: model ]
]

{ #category : #'building - graph' }
NetworkGraph >> rawNodes: aRawNodeList [

	nodes := aRawNodeList
]
