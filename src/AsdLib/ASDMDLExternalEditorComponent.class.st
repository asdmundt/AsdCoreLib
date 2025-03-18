Class {
	#name : #ASDMDLExternalEditorComponent,
	#superclass : #MAExternalEditorComponent,
	#category : #'AsdLib-Decorations'
}

{ #category : #rendering }
ASDMDLExternalEditorComponent >> renderButtonsOn: html [

	html mdlButton on: #remove of: self.
	html mdlButton on: #edit of: self
]
