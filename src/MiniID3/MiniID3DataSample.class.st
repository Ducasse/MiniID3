Class {
	#name : 'MiniID3DataSample',
	#superclass : 'Object',
	#category : 'MiniID3',
	#package : 'MiniID3'
}

{ #category : 'accessing' }
MiniID3DataSample >> asNode [
	"self new asNode"
	
	^ self data collect: [ :each | 
		 MiniID3Data new 
			from: each 
			for: #(outlook temperature humidity windy play) ].
]

{ #category : 'accessing' }
MiniID3DataSample >> data [

	^ #(
		#(sunny hot high false N)
		#(sunny hot high true N)
		#(overcast hot high false P)
		#(rain mild high false P)
		#(rain cool normal false P)
		#(rain cool normal true N)
		#(overcast cool normal true P)
		#(sunny mild high false N)
		#(sunny cool normal false P)
		#(rain mild normal false P)
		#(sunny mild normal true P)
		#(overcast mild high true P)
		#(overcast hot normal false P)
		#(rain midl high true N)
		)
]
