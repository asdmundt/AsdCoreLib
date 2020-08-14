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
		shadow: 2;
		mdlTypographyTextLeft;
		style: 'width: 100%; height: 100%;  background: #ffffff';
		with: [ html mdlCardTitleContainer
				style: 'color: #fff; background: #3E4EB8;';
				with: [ html mdlCardTitleText: self label level: 2 ].
			html mdlCardTextContainer
				with: [ "html mdlCardActions
				border;
				with: [ html mdlButton
						mdlTypographyFontBold;
						colored;
						rippleEffect;
						with: 'View Updates' ] " super renderContentOn: html ] ]
]

{ #category : #rendering }
ASDFormCardDecoration >> renderContentOn: html [
html mdlGrid
	style: 'height: 700px;';
		with: [ html mdlCell
				class: 'grid-cell-demo';
				size: 3.
			html mdlCell
				class: 'grid-cell-demo';
				middle;
				size: 6;
				with: [ self renderCardContentOn: html ].
			html mdlCell
				class: 'grid-cell-demo';
				middle;
				size: 3 ]
 
]
