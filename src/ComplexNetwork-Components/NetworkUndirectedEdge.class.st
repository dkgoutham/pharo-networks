"
A class to represent network edge.
"
Class {
	#name : #NetworkUndirectedEdge,
	#superclass : #Object,
	#instVars : [
		'model',
		'node1',
		'node2',
		'attributes'
	],
	#category : #'ComplexNetwork-Components'
}

{ #category : #adding }
NetworkUndirectedEdge >> addAttribute: anAttributeObject [

	attributes add: anAttributeObject
]

{ #category : #accessing }
NetworkUndirectedEdge >> asTuple [

	^ {node1 . node2 }
]

{ #category : #initialization }
NetworkUndirectedEdge >> initialize [

	attributes := OrderedCollection new
]

{ #category : #accessing }
NetworkUndirectedEdge >> model [

	^ model
]

{ #category : #accessing }
NetworkUndirectedEdge >> model: anObject [

	model := anObject
]

{ #category : #accessing }
NetworkUndirectedEdge >> node1 [

	^ node1
]

{ #category : #accessing }
NetworkUndirectedEdge >> node1: anObject [

	node1 := anObject
]

{ #category : #accessing }
NetworkUndirectedEdge >> node2 [

	^ node2
]

{ #category : #accessing }
NetworkUndirectedEdge >> node2: anObject [

	node2 := anObject
]

{ #category : #printing }
NetworkUndirectedEdge >> printOn: aStream [

	self node1 printOn: aStream.
	aStream nextPutAll: ' -> '.
	self node2 printOn: aStream
]
