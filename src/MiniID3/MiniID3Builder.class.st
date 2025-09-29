Class {
	#name : 'MiniID3Builder',
	#superclass : 'Object',
	#instVars : [
		'nodes',
		'id3ClassSelector',
		'nGlobal',
		'pGlobal',
		'id3ClassBlock'
	],
	#category : 'MiniID3',
	#package : 'MiniID3'
}

{ #category : 'accessing' }
MiniID3Builder >> ID3ClassBlock: aBlock [
	"an ID3 class block is a predicate that verifies one aspect of the conclusion.
	In the tennis data set it is the was the match played or not"
	
	id3ClassBlock := aBlock
]

{ #category : 'compute' }
MiniID3Builder >> computeEntropyOf: aPropertySelector [

	| dict entropy | 
	dict := nodes groupedBy: aPropertySelector.
	entropy := 0.
	dict keysAndValuesDo: [ :k :v | 
		| i |
		i := (self computeInformationOf: v forValue: k).
		entropy := entropy + ((i subsetSize / self setSize) asFloat * i information)
		].
	^ entropy
	
	
	
]

{ #category : 'compute' }
MiniID3Builder >> computeGainOf: aPropertySelector [
	
	
	^ (self computeInformation information) -
		(self computeEntropyOf: aPropertySelector)
	

	
	
	
]

{ #category : 'compute' }
MiniID3Builder >> computeInformation [

	^ self computeInformationOf: nodes
]

{ #category : 'compute' }
MiniID3Builder >> computeInformation3 [

	| classes n p propP propN i |
	classes := nodes groupedBy: [ :each | each play ].
	n := (classes at: 'N') size. 
	p := (classes at: 'P') size.
	
	propP := p/(n+p).
	propN := n/(n+p).
	i :=  ((propP * (propP log: 2)) negated) + ((propN * (propN log: 2)) negated).
	^ i
]

{ #category : 'compute' }
MiniID3Builder >> computeInformationOf2: nodeSubset [

	| n p propP propN i |
	n := nodeSubset count: id3ClassBlock.
	p := nodeSubset size - n.
	
	propP := p/(n+p).
	propN := n/(n+p).
	i :=  ((propP * (propP log: 2)) negated) + ((propN * (propN log: 2)) negated).
	^ i
]

{ #category : 'compute' }
MiniID3Builder >> computeInformationOf: nodeSubset [

	| n p |
	n := nodeSubset count: id3ClassBlock.
	p := nodeSubset size - n.
	^ MiniID3Information new 
		playedNumber: p notPlayedNumber: n
]

{ #category : 'compute' }
MiniID3Builder >> computeInformationOf: nodeSubset forValue: aString [

	^ (self computeInformationOf: nodeSubset) forValue: aString; yourself 
]

{ #category : 'accessing' }
MiniID3Builder >> computeMainID3ClassData [

	nodes ifNif: [ self error: 'Provide data' ].
	id3ClassBlock ifNil: [ self error: 'Please specify how to access the ID3Class' ].
	
	nGlobal := nodes count: id3ClassBlock.
	pGlobal := nodes size - nGlobal.
]

{ #category : 'as yet unclassified' }
MiniID3Builder >> gainOf: aString [ 
	self shouldBeImplemented.
]

{ #category : 'accessing' }
MiniID3Builder >> nodes: aCollection [ 
	nodes := aCollection
]

{ #category : 'initialization' }
MiniID3Builder >> setSize [ 

	^ nodes size
]

{ #category : 'compute' }
MiniID3Builder >> valuesOf: aPropertySelector [

	^ nodes collect: [ :aNode | aNode perform: aPropertySelector ] as: Set 
	
	
]
