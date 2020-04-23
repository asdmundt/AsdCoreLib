accessing
uploadedFileName: aFileName
	"fileReference - a FileSystem FileReference, or an MAFileReference if FileSystem is not installed"

	self propertyAt: #uploadedFileName put: aFileName