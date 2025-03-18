Class {
	#name : #ASDMAExternalEditorComponent,
	#superclass : #ASDMDLOneToOnerComponent,
	#category : #'AsdLib-Magritte'
}

{ #category : #testing }
ASDMAExternalEditorComponent class >> isAbstract [
	^ false
]

{ #category : #actions }
ASDMAExternalEditorComponent >> create [
	self chooser: (self editorFor: self selected new)
]

{ #category : #actions }
ASDMAExternalEditorComponent >> edit [
	self chooser: (self editorFor: self value)
]

{ #category : #rendering }
ASDMAExternalEditorComponent >> renderButtonsOn: html [

	html mdlButton on: #remove of: self; beSubmit .
	html mdlButton on: #edit of: self; beSubmit 
]

{ #category : #rendering }
ASDMAExternalEditorComponent >> renderViewerOn: html [
	html render: (self reference toString: self value)
]
