"
A class to represent a node's attribute.
"
Class {
	#name : #NetworkAttribute,
	#superclass : #Object,
	#instVars : [
		'model',
		'attributeName',
		'attributeValue'
	],
	#category : #'ComplexNetwork-Components'
}

{ #category : #getter }
NetworkAttribute >> attributeName [

	^ attributeName
]

{ #category : #setter }
NetworkAttribute >> attributeName: aString [

	attributeName := aString
]

{ #category : #getter }
NetworkAttribute >> attributeValue [

	^ attributeValue
]

{ #category : #setter }
NetworkAttribute >> attributeValue: aString [

	attributeValue := aString
]

{ #category : #initialization }
NetworkAttribute >> setAttribute: name value: value [

	attributeName := name.
	attributeValue := value
]
