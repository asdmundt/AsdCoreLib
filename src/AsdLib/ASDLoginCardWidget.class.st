Class {
	#name : #ASDLoginCardWidget,
	#superclass : #MDLLoginWidget,
	#category : #'AsdLib-Core'
}

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
