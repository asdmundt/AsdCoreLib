Class {
	#name : #ASDMDLReport,
	#superclass : #MDLMAReport,
	#instVars : [
		'title'
	],
	#category : #'AsdLib-Magritte'
}

{ #category : #accessing }
ASDMDLReport class >> displayName [
	self subclassResponsibility
]

{ #category : #initialization }
ASDMDLReport >> initialize [

	super initialize.
	self showBatch: true.
	self bordered: true.
	self striped: true
]

{ #category : #actions }
ASDMDLReport >> refreshReportFromObject: aClass [
	self rows: aClass selectAll.
	self refresh
]

{ #category : #actions }
ASDMDLReport >> remove: anObject [

	self subclassResponsibility
]

{ #category : #rendering }
ASDMDLReport >> renderCardContentOn: html [
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
ASDMDLReport >> renderContentOn: html [
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
ASDMDLReport >> title [
	^ title
]

{ #category : #accessing }
ASDMDLReport >> title: anObject [
	title := anObject
]
