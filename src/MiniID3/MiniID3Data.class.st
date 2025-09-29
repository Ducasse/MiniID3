Class {
	#name : 'MiniID3Data',
	#superclass : 'Object',
	#instVars : [
		'sunny',
		'outlook',
		'temperature',
		'humidity',
		'windy',
		'play'
	],
	#category : 'MiniID3',
	#package : 'MiniID3'
}

{ #category : 'instance creation' }
MiniID3Data >> from: aLine for: aCollectionOfSelectors [

	aCollectionOfSelectors 
		with: aLine
		do: [ :s :d | self perform: s asMutator with: d ]
		
]

{ #category : 'accessing' }
MiniID3Data >> humidity [
	^ humidity
]

{ #category : 'as yet unclassified' }
MiniID3Data >> humidity: aString [ 
	humidity := aString
]

{ #category : 'accessing' }
MiniID3Data >> outlook [
	^ outlook
]

{ #category : 'as yet unclassified' }
MiniID3Data >> outlook: aString [ 
	
		outlook := aString
]

{ #category : 'accessing' }
MiniID3Data >> play [
	^ play
]

{ #category : 'as yet unclassified' }
MiniID3Data >> play: aString [ 
	play := aString
]

{ #category : 'accessing' }
MiniID3Data >> printOn: aStream [

	aStream 
		nextPutAll: outlook ;
		space;
		nextPutAll: temperature ;
		space;
		nextPutAll: humidity;
		space;
		print: windy ;
		space;
		nextPutAll: play
]

{ #category : 'accessing' }
MiniID3Data >> temperature [
	^ temperature
]

{ #category : 'as yet unclassified' }
MiniID3Data >> temperature: aString [ 
	
	temperature := aString
]

{ #category : 'accessing' }
MiniID3Data >> windy [
	^ windy
]

{ #category : 'as yet unclassified' }
MiniID3Data >> windy: aBoolean [ 
	windy := aBoolean
]
