Class {
	#name : #ASDCardDecoration,
	#superclass : #WADecoration,
	#instVars : [
		'label'
	],
	#category : #'AsdLib-Decorations'
}

{ #category : #initalize }
ASDCardDecoration >> initialize [

super initialize 

]

{ #category : #accessing }
ASDCardDecoration >> label [

	^ label
]

{ #category : #accessing }
ASDCardDecoration >> label: anObject [

	label := anObject
]

{ #category : #rendering }
ASDCardDecoration >> renderContentOn: html [
]
