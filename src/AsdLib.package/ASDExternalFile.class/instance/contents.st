accessing
contents
	| contents |
	 self filepath asFileReference
		readStreamDo: [ :stream | 
			
			contents := stream upToEnd ].
	^ contents