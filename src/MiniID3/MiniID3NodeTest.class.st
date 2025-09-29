Class {
	#name : 'MiniID3NodeTest',
	#superclass : 'TestCase',
	#category : 'MiniID3',
	#package : 'MiniID3'
}

{ #category : 'tests' }
MiniID3NodeTest >> testComputeInformationOfBiPartition [

	| nodes b |
	nodes := MiniID3DataSample new asNode select: [ :each | each outlook = 'sunny' ].
	b := MiniID3Builder new 
		nodes: nodes;
		ID3ClassBlock: [ :each | each play = 'N' ].
	self 
		assert: (b computeInformation information - 0.971) < 0.01

]

{ #category : 'tests' }
MiniID3NodeTest >> testComputeInformationOfSinglePartitionMustBeZero [

	| nodes b |
	nodes := MiniID3DataSample new asNode select: [ :each | each outlook = 'overcast' ].
	b := MiniID3Builder new 
		nodes: nodes;
		ID3ClassBlock: [ :each | each play = 'N' ].
	self 
		assert: (b computeInformation information) 
		equals: 0
]

{ #category : 'tests' }
MiniID3NodeTest >> testComputeInformationOnAllNodes [
	| nodes b |
	nodes := MiniID3DataSample new asNode.
	b := MiniID3Builder new nodes: nodes. 
	b ID3ClassBlock: [ :each | each play = 'N' ].
	self 
		assert: (b computeInformation information - 0.940) < 0.01

]

{ #category : 'tests' }
MiniID3NodeTest >> testComputeInformationSubsetSize [
	| nodes b |
	nodes := MiniID3DataSample new asNode.
	b := MiniID3Builder new nodes: nodes. 
	b ID3ClassBlock: [ :each | each play = 'N' ].
	self 
		assert: (b computeInformationOf: (nodes select: [:each | each outlook = 'overcast'])) subsetSize
		equals: 4.
		
	self 
		assert: (b computeInformationOf: (nodes select: [:each | each outlook = 'sunny'])) subsetSize
		equals: 5.
		
	self 
		assert: (b computeInformationOf: (nodes select: [:each | each outlook = 'rain'])) subsetSize
		equals: 5.
]

{ #category : 'tests' }
MiniID3NodeTest >> testEntropie [
	| nodes b e |
	nodes := MiniID3DataSample new asNode.
	b := MiniID3Builder new nodes: nodes. 
	e := b computeEntropyOf: #outlook.
	
	self 
		assert: (b computeInformation - 0.694) < 0.01

]

{ #category : 'tests' }
MiniID3NodeTest >> testEntropieOfOutlook [
	| nodes b e |
	nodes := MiniID3DataSample new asNode.
	b := MiniID3Builder new nodes: nodes. 
	b ID3ClassBlock: [ :each | each play = 'N' ].
	e := b computeEntropyOf: #outlook.
	
	self 
		assert: (e - 0.694) < 0.01

]

{ #category : 'tests' }
MiniID3NodeTest >> testGainOfHumidity [
	| nodes b e |
	nodes := MiniID3DataSample new asNode.
	b := MiniID3Builder new nodes: nodes. 
	b ID3ClassBlock: [ :each | each play = 'N' ].
	e := b computeGainOf: #humidity.
	
	self 
		assert: (e - 0.151) < 0.01

]

{ #category : 'tests' }
MiniID3NodeTest >> testGainOfOutlook [
	| nodes b e |
	nodes := MiniID3DataSample new asNode.
	b := MiniID3Builder new nodes: nodes. 
	b ID3ClassBlock: [ :each | each play = 'N' ].
	e := b computeGainOf: #outlook.
	
	self 
		assert: (e - 0.246) < 0.01

]

{ #category : 'tests' }
MiniID3NodeTest >> testGainOfTemperature [
	| nodes b e |
	nodes := MiniID3DataSample new asNode.
	b := MiniID3Builder new nodes: nodes. 
	b ID3ClassBlock: [ :each | each play = 'N' ].
	e := b computeGainOf: #temperature.
	
	self 
		assert: (e - 0.029) < 0.01

]

{ #category : 'tests' }
MiniID3NodeTest >> testGainOfWindy [
	| nodes b e |
	nodes := MiniID3DataSample new asNode.
	b := MiniID3Builder new nodes: nodes. 
	b ID3ClassBlock: [ :each | each play = 'N' ].
	e := b computeGainOf: #windy.
	
	self 
		assert: (e - 0.048) < 0.01

]

{ #category : 'tests' }
MiniID3NodeTest >> testNodeCreation [ 

	| line inst |
	line := MiniID3DataSample new data first.
	inst := MiniID3Data new 
		from: line
		for: #(outlook temperature humidity windy play).
	self 
		assert: inst outlook 
		equals: 'sunny'.
	self 
		assert: inst temperature 
		equals: 'hot'.
	self 
		assert: inst humidity 
		equals: 'high'.
	self 
		assert: inst windy 
		equals: false.
	self 
		assert: inst play 
		equals: 'N'.
		
]

{ #category : 'tests' }
MiniID3NodeTest >> testSize [
	| nodes b |
	nodes := MiniID3DataSample new asNode.
	b := MiniID3Builder new nodes: nodes.
	
	self 
		assert: b setSize equals: 14
]

{ #category : 'tests' }
MiniID3NodeTest >> testSortAttributesBasedOnGain [
	| nodes b e |
	nodes := MiniID3DataSample new asNode.
	b := MiniID3Builder new nodes: nodes. 
	b ID3ClassBlock: [ :each | each play = 'N' ].
	e := b computeGainOf: #outlook.
	
	self 
		assert: (e - 0.246) < 0.01

]

{ #category : 'tests' }
MiniID3NodeTest >> testValuesOf [
	| nodes b v |
	nodes := MiniID3DataSample new asNode.
	b := MiniID3Builder new nodes: nodes. 
	v := b valuesOf: #outlook.
	
	self 
		assertCollection: v 
		equals: #('sunny' 'overcast' 'rain') asSet

]
