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
		Transcript show: 'entered';cr.
		line := fileStream nextLine.
		line:= line trim.
		line:= line asString.
		Transcript show: line;cr.
		parts := line split: ' '.
		Transcript show: parts size;cr.
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
