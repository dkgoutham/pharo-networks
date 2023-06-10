"
A class to represent network edge.
"
Class {
	#name : #NetworkEdge,
	#superclass : #Object,
	#instVars : [
		'model',
		'from',
		'to'
	],
	#category : #'ComplexNetwork-Components'
}

{ #category : #'instance creation' }
NetworkEdge class >> with: aModel [

	^ self new model: aModel
]

{ #category : #'instance creation' }
NetworkEdge class >> with: aModel from: srcNode to: dstNode [

	| edge |
	edge := self new.
	edge model: aModel.
	edge from: srcNode.
	edge to: dstNode.
	^ edge
]

{ #category : #accessing }
NetworkEdge >> asTuple [

	^ {from model . to model}
]

{ #category : #accessing }
NetworkEdge >> from [

	^ from
]

{ #category : #accessing }
NetworkEdge >> from: anObject [

	from := anObject
]

{ #category : #accessing }
NetworkEdge >> model [

	^ model
]

{ #category : #accessing }
NetworkEdge >> model: aModel [

	model := aModel
]

{ #category : #printing }
NetworkEdge >> printOn: aStream [

	self from printOn: aStream.
	aStream nextPutAll: ' -> '.
	self to printOn: aStream
]

{ #category : #accessing }
NetworkEdge >> to [

	^ to
]

{ #category : #accessing }
NetworkEdge >> to: anObject [

	to := anObject
]