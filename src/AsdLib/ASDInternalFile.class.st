Class {
	#name : #ASDInternalFile,
	#superclass : #Object,
	#instVars : [
		'name',
		'contents'
	],
	#classInstVars : [
		'upLoadedFileName'
	],
	#category : #'AsdLib-Core'
}

{ #category : #helpers }
ASDInternalFile class >> ensureDirectoryExists: filepath [
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
]

{ #category : #'instance creation' }
ASDInternalFile class >> filesize: filesize filename: filename filepath: filepath mimetype: mimetype [
	^ self new
		filesize: filesize;
		filename: filename;
		filepath: filepath;
		mimetype: mimetype greaseString;
		yourself
]

{ #category : #voyage }
ASDInternalFile class >> isVoyageRoot [
	"Indicates that instances of this class are top level documents
    in noSQL databases"

	^ true
]

{ #category : #accessing }
ASDInternalFile class >> upLoadedFileName [
^upLoadedFileName
]

{ #category : #accessing }
ASDInternalFile class >> upLoadedFileName: aFileName [
	upLoadedFileName := aFileName
]
