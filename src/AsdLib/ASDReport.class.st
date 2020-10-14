Class {
	#name : #ASDReport,
	#superclass : #MDLMAReport,
	#instVars : [
		'planer',
		'title'
	],
	#category : #'AsdLib-Components'
}

{ #category : #accessing }
ASDReport class >> displayName [
	self subclassResponsibility
]

{ #category : #initialization }
ASDReport >> initialize [
	super initialize.
	self showBatch: false.
]

{ #category : #accessing }
ASDReport >> planer [
	^ planer
]

{ #category : #accessing }
ASDReport >> planer: anObject [
	planer := anObject
]

{ #category : #actions }
ASDReport >> refreshReportFromObject: aClass [
	self rows: aClass selectAll.
	self refresh
]

{ #category : #rendering }
ASDReport >> renderCardContentOn: html [
	html mdlCard
		shadow: 0;
		mdlTypographyTextLeft;
		style: 'width: 100%; height: 100%;';
		with: [ html mdlCardTitleContainer
				with: [ html mdlCardTitleText: self title level: 2 ].
			html mdlCardTextContainer
				style: 'width: 100%; height: 300px; overflow-y: auto;';
				with: [ super renderContentOn: html ].
			html mdlCardActions
				border;
				with: [ html space ] ]
]

{ #category : #rendering }
ASDReport >> renderContentOn: html [
	html mdlGrid
		style: 'height: 600px;';
		with: [ "style: 'height: 700px;';"
			
			html mdlCell
				class: 'grid-cell-demo';
				middle;
				size: 12;
				tabletSize: 12;
				with: [ self renderCardContentOn: html ].
			 ]
]

{ #category : #accessing }
ASDReport >> title [
	^ title
]

{ #category : #accessing }
ASDReport >> title: anObject [
	title := anObject
]
