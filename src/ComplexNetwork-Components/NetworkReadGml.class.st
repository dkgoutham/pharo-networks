"
A class that creates network by reading from a file.
"
Class {
	#name : #NetworkReadGml,
	#superclass : #Object,
	#category : #'ComplexNetwork-Components'
}

{ #category : #'as yet unclassified' }
NetworkReadGml >> createEdge: fileStream graph: aGraph [

	| line parts curEdge sourceId targetId |
	line := fileStream nextLine.
	line := line trim.
	parts := self splitStringFirst: line.

	parts first = '[' ifTrue: [
		line := fileStream nextLine.
		line := line trim.
		parts := self splitStringFirst: line ].

	sourceId := parts second.

	line := fileStream nextLine.
	line := line trim.
	parts := self splitStringFirst: line.

	targetId := parts second.

	aGraph addEdge: sourceId to: targetId.
	curEdge := aGraph edges last.

	line := fileStream nextLine.
	line := line trim.
	parts := self splitStringFirst: line.

	[ parts first = ']' ] whileFalse: [
		| curAttribute |
		curAttribute := NetworkAttribute new.
		curAttribute setAttribute: parts first value: parts second.
		curEdge addAttribute: curAttribute.
		line := fileStream nextLine.
		line := line trim.
		parts := self splitStringFirst: line ]
]

{ #category : #'as yet unclassified' }
NetworkReadGml >> createNode: fileStream graph: aGraph [

	| line parts curNode |
	line := fileStream nextLine.
	line := line trim.
	parts := self splitStringFirst: line.

	[ parts first = ']' ] whileFalse: [
		parts first = '[' ifTrue: [
			line := fileStream nextLine.
			line := line trim.
			parts := self splitStringFirst: line ].
		parts first = 'id' ifTrue: [
			aGraph addNodeFor: parts second.
			curNode := aGraph nodes last ].
		parts first = 'id' ifFalse: [
			| curAttribute |
			curAttribute := NetworkAttribute new.
			curAttribute setAttribute: parts first value: parts second.
			curNode addAttribute: curAttribute ].
		line := fileStream nextLine.
		line := line trim.
		parts := self splitStringFirst: line ]
]

{ #category : #'as yet unclassified' }
NetworkReadGml >> readFromUrl: url [

	| graph fileStream |
	graph := NetworkGraph new.

	"Open and read the GML file"
	fileStream := url asFileReference readStream.

	[ fileStream atEnd ] whileFalse: [
		| line parts |
		Transcript
			show: 'entered';
			cr.
		line := fileStream nextLine.
		line := line trim.
		"Transcript show: line;cr."
		"parts := line split: ' '."
		parts := self stringSplitSpace: line.
		Transcript
			show: parts size;
			cr.

		parts first = 'node' ifTrue: [ "Create node"
			self createNode: fileStream graph: graph ].
		parts first = 'edge' ifTrue: [ "Create edge"
			self createEdge: fileStream graph: graph ] ].
	^ graph
]

{ #category : #'as yet unclassified' }
NetworkReadGml >> splitStringFirst: aString [

	| parts last |
	parts := OrderedCollection new.
	last := 1.
	aString withIndexDo: [ :element :index |
		element = Character space ifTrue: [ last := index - 1 ] ].
	parts add: (aString copyFrom: 1 to: last).
	last + 2 > aString size ifFalse: [
		parts add: (aString copyFrom: last + 2 to: aString size) ].
	^ parts
]

{ #category : #'as yet unclassified' }
NetworkReadGml >> stringSplitSpace: aString [

	| parts last |
	parts := OrderedCollection new.
	last := 1.
	aString withIndexDo: [ :element :index |
		element = Character space ifTrue: [
			parts add: (aString copyFrom: last to: index - 1).
			last := index + 1 ] ].
	last > aString size ifFalse: [
		parts add: (aString copyFrom: last to: aString size) ].
	^ parts
]
