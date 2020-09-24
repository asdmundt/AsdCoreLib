"
I represent an external file saved on the disk not in memory. I differ from ==MAExternalFileModel== as I don't deal with saving a file contents and generating a unique location, I only read files and don't write them. I expect to be passed a filepath to an already saved file.
I also store a url used to retrieve the file via a web server.
"
Class {
	#name : #ASDExternalFile,
	#superclass : #MAFileModel,
	#instVars : [
		'filepath',
		'url'
	],
	#classInstVars : [
		'upLoadedFileName'
	],
	#category : #'AsdLib-Core'
}

{ #category : #helpers }
ASDExternalFile class >> ensureDirectoryExists: filepath [
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
ASDExternalFile class >> filesize: filesize filename: filename filepath: filepath mimetype: mimetype [
	^ self new
		filesize: filesize;
		filename: filename;
		filepath: filepath;
		mimetype: mimetype greaseString;
		yourself
]

{ #category : #accessing }
ASDExternalFile class >> upLoadedFileName [
^upLoadedFileName
]

{ #category : #accessing }
ASDExternalFile class >> upLoadedFileName: aFileName [
	upLoadedFileName := aFileName
]

{ #category : #accessing }
ASDExternalFile >> contents [
	| contents |
	FileStream fileNamed: self filepath do: [ :stream |
		stream binary.
		contents := stream contents ].

	^ contents

]

{ #category : #accessing }
ASDExternalFile >> filepath [
	^ filepath
		ifNil: [ FileLocator imageDirectory / 'files' ]
]

{ #category : #accessing }
ASDExternalFile >> filepath: anObject [
	filepath := anObject asFileReference
]

{ #category : #accessing }
ASDExternalFile >> filesize: theFileSize [
	filesize := theFileSize
]

{ #category : #json }
ASDExternalFile >> jsonOn: aStream [
	"Alternatively could use Magritte Json integration.
	Describe the model with magritte, adding jsonName: calls
	For example:
	descriptionUrl
	^ MAStringDescription new
		accessor: (MAPluggableAccessor read: [ :model | model url greaseString ] write: [ :model :object | model url: object ]);
		jsonName: 'url';
		label: 'url';
		yourself"
		
	(Dictionary new
		at: #mimetype put: self mimetype;
		at: #filename put: self filename;	
		at: #filepath put: self filepath;
		at: #filesize put: self filesize;
		at: #url put: self url greaseString;
		yourself) jsonOn: aStream
]

{ #category : #accessing }
ASDExternalFile >> url [
	^ url
]

{ #category : #accessing }
ASDExternalFile >> url: anObject [
	url := anObject
]
