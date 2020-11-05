Class {
	#name : #ASDLoginCardWidget,
	#superclass : #MDLLoginWidget,
	#category : #'AsdLib-Core'
}

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
				shadow: 0;
				class: 'mdl-card__login-widget';
				class: (properties at: #class: ifPresent: [ :aString | aString ] ifAbsent: [ '' ]);
				title: titleLabel level: titleLevel;
				addTextContainer: [ :canvas | super renderContentOn: canvas ];
				yourself)
]