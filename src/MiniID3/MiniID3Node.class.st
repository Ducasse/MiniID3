Class {
	#name : 'MiniID3Node',
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
MiniID3Node >> from: aLine for: aCollectionOfSelectors [

	aCollectionOfSelectors 
		with: aLine
		do: [ :s :d | self perform: s asMutator with: d ]
		
]

{ #category : 'accessing' }
MiniID3Node >> humidity [
	^ humidity
]

{ #category : 'as yet unclassified' }
MiniID3Node >> humidity: aString [ 
	humidity := aString
]

{ #category : 'accessing' }
MiniID3Node >> outlook [
	^ outlook
]

{ #category : 'as yet unclassified' }
MiniID3Node >> outlook: aString [ 
	
		outlook := aString
]

{ #category : 'accessing' }
MiniID3Node >> play [
	^ play
]

{ #category : 'as yet unclassified' }
MiniID3Node >> play: aString [ 
	play := aString
]

{ #category : 'accessing' }
MiniID3Node >> printOn: aStream [

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
MiniID3Node >> temperature [
	^ temperature
]

{ #category : 'as yet unclassified' }
MiniID3Node >> temperature: aString [ 
	
	temperature := aString
]

{ #category : 'accessing' }
MiniID3Node >> windy [
	^ windy
]

{ #category : 'as yet unclassified' }
MiniID3Node >> windy: aBoolean [ 
	windy := aBoolean
]
