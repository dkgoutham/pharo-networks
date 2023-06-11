"
This class represents a directed edge in the network.
"
Class {
	#name : #NetworkDirectedEdge,
	#superclass : #Object,
	#instVars : [
		'model',
		'from',
		'to',
		'attributes'
	],
	#category : #'ComplexNetwork-Components'
}

{ #category : #adding }
NetworkDirectedEdge >> addAttribute: anAttributeObject [

	attributes add: anAttributeObject
]

{ #category : #converting }
NetworkDirectedEdge >> asTuple [

	^ {from . to }
]

{ #category : #accessing }
NetworkDirectedEdge >> from [

	^ from
]

{ #category : #accessing }
NetworkDirectedEdge >> from: anObject [

	from := anObject
]

{ #category : #initialization }
NetworkDirectedEdge >> initialize [

	attributes := OrderedCollection new
]

{ #category : #accessing }
NetworkDirectedEdge >> model [

	^ model
]

{ #category : #accessing }
NetworkDirectedEdge >> model: anObject [

	model := anObject
]

{ #category : #printing }
NetworkDirectedEdge >> printOn: aStream [

	self from printOn: aStream.
	aStream nextPutAll: ' -> '.
	self to printOn: aStream
]

{ #category : #accessing }
NetworkDirectedEdge >> to [

	^ to
]

{ #category : #accessing }
NetworkDirectedEdge >> to: anObject [

	to := anObject
]
