Class {
	#name : #ASDLoginCardWidget,
	#superclass : #ASDLoginWidget,
	#instVars : [
		'errorMessage'
	],
	#category : #'AsdLib-Core'
}

{ #category : #'instance creation' }
ASDLoginCardWidget class >> erorMessage: aMessage [
	^ self new
	errorMessage: aMessage; 
	 yourself
]

{ #category : #accessing }
ASDLoginCardWidget >> errorMessage [
	^ errorMessage
]

{ #category : #accessing }
ASDLoginCardWidget >> errorMessage: anObject [
	errorMessage := anObject
]

{ #category : #initialization }
ASDLoginCardWidget >> initialize [
	super initialize.
	titleLabel := 'Bitte hier Einloggen'.
	titleLevel := 2.
	loginLabel := 'BenutzerName'.
	cancelLabel := 'abbrechen'.
	passwordLabel := 'Passwort'.
	submitLabel := 'weiter'
]

{ #category : #rendering }
ASDLoginCardWidget >> renderContentOn: html [
	html
		render:
			(MDLCardWidget new
				shadow: 1;
				class: 'mdl-card__login-widget';
				class:
					(properties
						at: #class:
						ifPresent: [ :aString | aString ]
						ifAbsent: [ '' ]);
				title: titleLabel level: titleLevel;
				addTextContainer: [ :canvas | super renderContentOn: canvas ];
				yourself)
]
