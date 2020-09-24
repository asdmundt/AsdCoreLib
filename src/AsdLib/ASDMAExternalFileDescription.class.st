"
ExternalFileDescription mit  einem Dateinamen der sich aus dem Ordername und dem BestellungenName zusammensetzt
"
Class {
	#name : #ASDMAExternalFileDescription,
	#superclass : #MAElementDescription,
	#category : #'AsdLib-Magritte'
}

{ #category : #'accessing-defaults' }
ASDMAExternalFileDescription class >> defaultDisplayProperty [

	^ [ :e | e fullName ].
]

{ #category : #'accessing-defaults' }
ASDMAExternalFileDescription class >> defaultKind [
	^ ASDExternalFile
]

{ #category : #testing }
ASDMAExternalFileDescription class >> isAbstract [
	^ false
]

{ #category : #accessing }
ASDMAExternalFileDescription class >> label [
	^ 'File'
]

{ #category : #visiting }
ASDMAExternalFileDescription >> acceptMagritte: aVisitor [
	aVisitor visitFileDescription: self
]

{ #category : #accessing }
ASDMAExternalFileDescription >> defaultDirectory [
	^ self propertyAt: #defaultDirectory ifAbsent: [ MAExternalFileModel baseDirectory ]
]

{ #category : #accessing }
ASDMAExternalFileDescription >> defaultDirectory: fileReference [
	"fileReference - a FileSystem FileReference, or an MAFileReference if FileSystem is not installed"

	self propertyAt: #defaultDirectory put: fileReference
]

{ #category : #accessing }
ASDMAExternalFileDescription >> uploadedFileName [
	^ self propertyAt: #uploadedFileName 
]

{ #category : #accessing }
ASDMAExternalFileDescription >> uploadedFileName: aFileName [
	"fileReference - a FileSystem FileReference, or an MAFileReference if FileSystem is not installed"

	self propertyAt: #uploadedFileName put: aFileName
]
