Class {
	#name : 'MiniID3NodeTest',
	#superclass : 'TestCase',
	#category : 'MiniID3',
	#package : 'MiniID3'
}

{ #category : 'tests' }
MiniID3NodeTest >> testComputeInformation [
	| nodes b |
	nodes := MiniID3DataSample new asNode.
	b := MiniID3Builder new nodes: nodes. 
	self 
		assert: (b computeInformation - 0.940) < 0.01

]

{ #category : 'tests' }
MiniID3NodeTest >> testNodeCreation [ 

	| line inst |
	line := MiniID3DataSample new data first.
	inst := MiniID3Node new 
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
