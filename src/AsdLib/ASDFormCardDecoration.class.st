"
Rendert ein Magritte FormDecoration Component als Flat card Komponente
"
Class {
	#name : #ASDFormCardDecoration,
	#superclass : #MDLMAFormDecoration,
	#instVars : [
		'label'
	],
	#category : #'AsdLib-Magritte'
}

{ #category : #initalize }
ASDFormCardDecoration >> initialize [

	super initialize.
]

{ #category : #accessing }
ASDFormCardDecoration >> label [
	^ label
]

{ #category : #accessing }
ASDFormCardDecoration >> label: anObject [
	label := anObject
]

{ #category : #rendering }
ASDFormCardDecoration >> renderCardContentOn: html [

	html mdlCard
		shadow: 3;
		mdlTypographyTextLeft;
		style: 'width: 100%; height: 100%;';
		id: 'cardDescription';
		with: [ 
			html mdlCardTitleContainer with: [ 
					html mdlCardTitleText: self label level: 2 ].
			html mdlCardTextContainer with: [ "html mdlCardActions
				border;
				with: [ html mdlButton
						mdlTypographyFontBold;
						colored;
						rippleEffect;
						with: 'View Updates' ] " 
					super renderContentOn: html ] ].
			
]

{ #category : #rendering }
ASDFormCardDecoration >> renderContentOn: html [

self renderCardContentOn: html
]
