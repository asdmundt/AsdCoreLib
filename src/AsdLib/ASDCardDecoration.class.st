Class {
	#name : #ASDCardDecoration,
	#superclass : #WADecoration,
	#instVars : [
		'errorMessage',
		'titleLabel',
		'titleLevel'
	],
	#category : #'AsdLib-Core'
}

{ #category : #'instance creation' }
ASDCardDecoration class >> erorMessage: aMessage [
	^ self new
	errorMessage: aMessage; 
	 yourself
]

{ #category : #accessing }
ASDCardDecoration >> errorMessage [
	^ errorMessage
]

{ #category : #accessing }
ASDCardDecoration >> errorMessage: anObject [
	errorMessage := anObject
]

{ #category : #initialization }
ASDCardDecoration >> initialize [

	super initialize.
	titleLabel := 'Bitte hier Einloggen'.
	titleLevel := 2.

]

{ #category : #rendering }
ASDCardDecoration >> renderContentOn: html [

	html render: (MDLCardWidget new
				 shadow: 2;
				 style: 'width: 400px;';
				 class: 'mdl-card__decoration';
				 title: titleLabel level: titleLevel;
				 addTextContainer: [ :canvas | self renderNextOn: canvas ];
				 yourself).
]

{ #category : #accessing }
ASDCardDecoration >> titleLabel [

	^ titleLabel
]

{ #category : #accessing }
ASDCardDecoration >> titleLabel: anObject [

	titleLabel := anObject
]

{ #category : #accessing }
ASDCardDecoration >> titleLevel [

	^ titleLevel
]

{ #category : #accessing }
ASDCardDecoration >> titleLevel: anObject [

	titleLevel := anObject
]
