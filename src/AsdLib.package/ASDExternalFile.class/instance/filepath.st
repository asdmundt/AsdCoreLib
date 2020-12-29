accessing
filepath
	^ filepath
		ifNil: [ FileLocator imageDirectory / 'files' ]