accessing
defaultDirectory
	^ self propertyAt: #defaultDirectory ifAbsent: [ MAExternalFileModel baseDirectory ]