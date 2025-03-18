Class {
	#name : #ASDMDLOneToOnerComponent,
	#superclass : #MAOneToOneComponent,
	#category : #'AsdLib-Magritte'
}

{ #category : #testing }
ASDMDLOneToOnerComponent class >> isAbstract [

	^ false
]

{ #category : #rendering }
ASDMDLOneToOnerComponent >> renderSelectButtonOn: html [

	html mdlButton on: #create of: self; beSubmit
]
