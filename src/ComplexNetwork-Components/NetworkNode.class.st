"
A class to represent a network node.
"
Class {
	#name : #NetworkNode,
	#superclass : #Object,
	#instVars : [
		'id',
		'adjacentNodes',
		'adjacentEdges',
		'attributes'
	],
	#category : #'ComplexNetwork-Components'
}

{ #category : #'instance creation' }
NetworkNode class >> with: anId [

	^ self new id: anId
]

{ #category : #adding }
NetworkNode >> addAttribute: anAttributeObject [

	attributes add: anAttributeObject
]

{ #category : #accessing }
NetworkNode >> adjacentEdges [

	^ adjacentEdges
]

{ #category : #accessing }
NetworkNode >> adjacentEdges: aEdgeList [

	adjacentEdges := aEdgeList
]

{ #category : #accessing }
NetworkNode >> adjacentNodes [

	^ adjacentNodes
]

{ #category : #accessing }
NetworkNode >> adjacentNodes: aNodeList [

	adjacentNodes := aNodeList
]

{ #category : #accessing }
NetworkNode >> from: sourceNode [
]

{ #category : #accessing }
NetworkNode >> from: sourceNode edge: anEdge [
]

{ #category : #accessing }
NetworkNode >> id [

	^ id
]

{ #category : #accessing }
NetworkNode >> id: aId [

	id := aId
]

{ #category : #initialization }
NetworkNode >> initialize [

	super initialize.
	adjacentNodes := OrderedCollection new.
	attributes := OrderedCollection new.
	adjacentEdges := OrderedCollection new.
]

{ #category : #accessing }
NetworkNode >> label [

	^ 'Node: '
]

{ #category : #printing }
NetworkNode >> printOn: stream [

	stream nextPutAll: self label.
	id printOn: stream
]

{ #category : #accessing }
NetworkNode >> to: targetNode [

	adjacentNodes add: targetNode
]

{ #category : #accessing }
NetworkNode >> to: targetNode edge: anEdge [

	adjacentNodes add: targetNode.
	adjacentEdges add: anEdge
]
