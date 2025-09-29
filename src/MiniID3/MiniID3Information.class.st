Class {
	#name : 'MiniID3Information',
	#superclass : 'Object',
	#instVars : [
		'playedNumber',
		'notPlayedNumber',
		'forValue',
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
	 
	playedNumber isZero or: [ notPlayedNumber isZero 
		ifTrue: [ information := 0. ^ self ] ].
	propP := playedNumber/(notPlayedNumber +playedNumber).
	propN := notPlayedNumber/(notPlayedNumber+playedNumber).
	information :=  ((propP * (propP log: 2)) negated) + ((propN * (propN log: 2)) negated).
	
]

{ #category : 'as yet unclassified' }
MiniID3Information >> forValue: aString [

	forValue := aString
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
MiniID3Information >> printOn: aStream [

	aStream nextPutAll: forValue asString.
	aStream 
		space;
		nextPutAll: 'p: ';
		print: playedNumber;
		nextPutAll: ' n: ';
		print: notPlayedNumber; 
		nextPutAll: 'inf: ';
		print: information
]

{ #category : 'as yet unclassified' }
MiniID3Information >> subsetSize [
	^ notPlayedNumber + playedNumber
]
