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
	submitLabel := 'weiter'.
	errorMessage := 'Zugangsdaten ungültig'
]

{ #category : #rendering }
ASDLoginCardWidget >> renderContentOn: html [
	html
		render:
			(MDLCardWidget new
				shadow: 2;
				style: 'width: 400px;';
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

{ #category : #hooks }
ASDLoginCardWidget >> style [

	^ '.mdl-card__login-widget{
    background-color: rgb(22, 27, 34);
    box-shadow: rgb(48 54 61) 0px 0px 0px 1px, rgb(1 4 9 / 85%) 0px 16px 32px;
    position: absolute;
    min-width: 192px;
    max-width: 640px;
    height: auto;
    width: 256px;
    border-radius: 12px;
    overflow: hidden auto;
    animation: 200ms cubic-bezier(0.33, 1, 0.68, 1) 0s 1 normal none running overlay-appear;
    visibility: var(--styled-overlay-visibility);
    max-height: 55vh;
}'
]
