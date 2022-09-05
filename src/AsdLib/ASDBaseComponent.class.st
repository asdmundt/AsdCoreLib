Class {
	#name : #ASDBaseComponent,
	#superclass : #MDLWidget,
	#instVars : [
		'model'
	],
	#category : #'AsdLib-Components'
}

{ #category : #'instance creation' }
ASDBaseComponent class >> withModel: aModel [

	^ self new model: aModel; yourself 
]

{ #category : #accessing }
ASDBaseComponent >> model [

	^ model
]

{ #category : #accessing }
ASDBaseComponent >> model: anObject [

	model := anObject
]
