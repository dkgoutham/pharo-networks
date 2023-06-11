"
A class to represent network edge.
"
Class {
	#name : #NetworkEdge,
	#superclass : #Object,
	#instVars : [
		'from',
		'to',
		'attributes'
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

{ #category : #'instance creation' }
NetworkEdge class >> with:srcNode to: dstNode [

	| edge |
	edge := self new.
	edge from: srcNode.
	edge to: dstNode.
	^ edge
]

{ #category : #adding }
NetworkEdge >> addAttribute: anAttributeObject [

	attributes add: anAttributeObject
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

{ #category : #initialization }
NetworkEdge >> initialize [

	attributes := OrderedCollection new
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
