Class {
	#name : 'MiniID3Information',
	#superclass : 'Object',
	#instVars : [
		'playedNumber',
		'notPlayedNumber',
		'subset',
		'information',
		'propP',
		'p',
		'n',
		'propN'
	],
	#category : 'MiniID3',
	#package : 'MiniID3'
}

{ #category : 'accessing' }
MiniID3Information >> compute [

	propP := playedNumber/(notPlayedNumber +playedNumber).
	propN := notPlayedNumber/(notPlayedNumber+playedNumber).
	information :=  ((propP * (propP log: 2)) negated) + ((propN * (propN log: 2)) negated).
	
]

{ #category : 'accessing' }
MiniID3Information >> information [

	^ information
]

{ #category : 'accessing' }
MiniID3Information >> notPlayedNumber [

	^ notPlayedNumber
]

{ #category : 'accessing' }
MiniID3Information >> playedNumber [

	^ playedNumber
]

{ #category : 'accessing' }
MiniID3Information >> playedNumber: anInteger notPlayedNumber: anotherInteger [

	playedNumber := anInteger.
	notPlayedNumber := anotherInteger.
	self compute
]

{ #category : 'as yet unclassified' }
MiniID3Information >> subsetSize [
	^ notPlayedNumber + playedNumber
]
