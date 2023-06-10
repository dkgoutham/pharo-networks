"
A class that creates network by reading from a file.
"
Class {
	#name : #NetworkRead,
	#superclass : #Object,
	#category : #'ComplexNetwork-Components'
}

{ #category : #'as yet unclassified' }
NetworkRead >> readFromUrl: url [

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
			Transcript
				show: 'node';
				cr.
			[ parts first = ']' ] whileFalse: [
				line := fileStream nextLine.
				parts := line split: ' ' ] ].
		parts first = 'edge' ifTrue: [
			Transcript
				show: 'edge';
				cr.
			[ parts first = ']' ] whileFalse: [
				line := fileStream nextLine.
				parts := line split: ' ' ] ] ]
]

{ #category : #'as yet unclassified' }
NetworkRead >> stringSplitSpace: aString [

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
