helpers
ensureDirectoryExists: filepath
	| platform separator path directories currentFolder startCreationFolder |
	platform := GRPlatform current.
	separator := platform pathSeparator.
	currentFolder := FileSystem disk workingDirectory.
	startCreationFolder := ''.
	path := (filepath beginsWith: currentFolder)
		ifTrue: [
			startCreationFolder := FileSystem disk workingDirectory.
			filepath allButFirst:  currentFolder size ]
		ifFalse: [ filepath ].
		
	directories := path substrings: separator.
	directories
		inject: startCreationFolder
		into: [ :lastPath :pathElement | 
			| currrentPath |
			currrentPath := lastPath , separator , pathElement.
			platform ensureExistenceOfFolder: currrentPath.
			currrentPath ]