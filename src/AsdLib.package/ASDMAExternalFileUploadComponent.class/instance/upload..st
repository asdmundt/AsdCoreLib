actions
upload: file
	| stream destinationFilepath working |
	working := FileSystem disk / 'var' / 'www' / 'html' / file fileName.
	stream := (File named: working asFileReference fullName) writeStream.
	destinationFilepath := stream name.
	[ stream
		binary;
		nextPutAll: file rawContents ]
		ensure: [ stream close ].
	self
		value:
			(file isNil
				ifFalse: [ self magritteDescription kind
						filesize: file size
						filename: file fileName
						filepath: destinationFilepath
						mimetype: file contentType ])