Class {
	#name : #ASDMAInternalEditorComponent,
	#superclass : #ASDMDLOneToOnerComponent,
	#instVars : [
		'component'
	],
	#category : #'AsdLib-Magritte'
}

{ #category : #testing }
ASDMAInternalEditorComponent class >> isAbstract [
	^ false
]

{ #category : #private }
ASDMAInternalEditorComponent >> buildComponent [
	^ self value isNil ifFalse: [ 
		(self magritteDescription reference asComponentOn: self value)
			setParent: self;
			yourself ]
]

{ #category : #accessing }
ASDMAInternalEditorComponent >> children [
	^ Array with: self component
]

{ #category : #accessing }
ASDMAInternalEditorComponent >> component [
	^ component ifNil: [ component := self buildComponent ]
]

{ #category : #actions }
ASDMAInternalEditorComponent >> create [
	self value: self selected new.
	component := nil
]

{ #category : #rendering }
ASDMAInternalEditorComponent >> renderViewerOn: html [
	html render: (self component
		readonly: self isReadonly;
		yourself)
]
