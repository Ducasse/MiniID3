Class {
	#name : 'MiniID3Builder',
	#superclass : 'Object',
	#instVars : [
		'nodes'
	],
	#category : 'MiniID3',
	#package : 'MiniID3'
}

{ #category : 'as yet unclassified' }
MiniID3Builder >> computeInformation [

	| classes n p propP propN i |
	classes := nodes groupedBy: [ :each | each play ].
	n := (classes at: 'N') size. 
	p := (classes at: 'P') size.
	
	propP := p/(n+p).
	propN := n/(n+p).
	i :=  ((propP * (propP log: 2)) negated) + ((propN * (propN log: 2)) negated).
	^ i
]

{ #category : 'accessing' }
MiniID3Builder >> nodes: aCollection [ 
	nodes := aCollection
]
