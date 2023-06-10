"
A class to represent a network node.
"
Class {
	#name : #NetworkNode,
	#superclass : #Object,
	#instVars : [
		'model',
		'adjacentNodes'
	],
	#category : #'ComplexNetwork-Components'
}

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

{ #category : #initialization }
NetworkNode >> initialize [

	super initialize.
	adjacentNodes := OrderedCollection new
]

{ #category : #accessing }
NetworkNode >> label [

	^ 'Node: '
]

{ #category : #accessing }
NetworkNode >> model [

	^ model
]

{ #category : #accessing }
NetworkNode >> model: aModel [

	model := aModel
]

{ #category : #printing }
NetworkNode >> printOn: stream [

	stream nextPutAll: self label.
	model printOn: stream
]

{ #category : #accessing }
NetworkNode >> to: targetNode [

	adjacentNodes add: targetNode
]

{ #category : #accessing }
NetworkNode >> to: targetNode edge: anEdge [
]
