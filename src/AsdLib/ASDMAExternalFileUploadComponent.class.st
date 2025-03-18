Class {
	#name : #ASDMAExternalFileUploadComponent,
	#superclass : #MAElementComponent,
	#category : #'AsdLib-Magritte'
}

{ #category : #testing }
ASDMAExternalFileUploadComponent class >> isAbstract [
	^ false
]

{ #category : #testing }
ASDMAExternalFileUploadComponent >> hasLabelId [
	^ self requiresMultipartForm
]

{ #category : #actions }
ASDMAExternalFileUploadComponent >> remove [
	self value isNil
		ifFalse: [ self value finalize ].
	self value: nil
]

{ #category : #rendering }
ASDMAExternalFileUploadComponent >> renderEditorOn: html [
	self requiresMultipartForm
		ifTrue: [ self renderUploadOn: html ]
		ifFalse: [ self renderRemoveOn: html ]
]

{ #category : #rendering }
ASDMAExternalFileUploadComponent >> renderRemoveOn: html [

	html render: self value.
	html
		text: ' (';
		render: self value filesize asFileSize;
		text: ') '.
	html mdlButton on: #remove of: self
]

{ #category : #rendering }
ASDMAExternalFileUploadComponent >> renderUploadOn: html [

	html fileUpload
		id: self labelId;
		on: #upload of: self.
	html mdlButton text: 'upload'
]

{ #category : #rendering }
ASDMAExternalFileUploadComponent >> renderViewerOn: html [
	html render: self value,'test'
]

{ #category : #testing }
ASDMAExternalFileUploadComponent >> requiresMultipartForm [
	^ self isReadonly not and: [ self value isNil or: [ self value isEmpty ] ]
]

{ #category : #actions }
ASDMAExternalFileUploadComponent >> upload: file [
	| stream destinationFilepath working |
	working := FileLocator imageDirectory / 'files' / file fileName.
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
]
