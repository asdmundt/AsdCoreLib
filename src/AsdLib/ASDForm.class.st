Class {
	#name : #ASDForm,
	#superclass : #MDLHighLevelWidget,
	#instVars : [
		'model',
		'withform',
		'isAjax',
		'callback',
		'onClickBlock',
		'withCard',
		'labelAction',
		'dict',
		'withPanel',
		'labelSelf'
	],
	#category : #'AsdLib-Components'
}

{ #category : #'instance creation' }
ASDForm class >> withModel: aModel [

	^ self new
		  model: aModel;
		  withform: false;
		 withPanel: false;
		  yourself
]

{ #category : #'instance creation' }
ASDForm class >> withModel: aModel andDict: aDict [

	^ self new
		  model: aModel;
			dict: aDict;
		  withForm: false
]

{ #category : #'instance creation' }
ASDForm class >> withModel: aModel andForm: aBoolean [

	^ self new
		  model: aModel;
		  withform: aBoolean;
		yourself 
]

{ #category : #'instance creation' }
ASDForm class >> withModel: aModel andOnClickBlock: aBlock [
	^ self new
		model: aModel;
		onClickBlock: aBlock;
		isAjax: true;
		withForm: true
]

{ #category : #'instance creation' }
ASDForm class >> withModel: aModel andPanel: aBoolean [

	^ self new
		  model: aModel;
		  withform: false;
		  withPanel: aBoolean;
		 yourself
]

{ #category : #accessing }
ASDForm >> callback [
	^ callback
]

{ #category : #accessing }
ASDForm >> callback: anObject [
	callback := anObject
]

{ #category : #accessing }
ASDForm >> dict [

	^ dict
]

{ #category : #accessing }
ASDForm >> dict: anObject [

	dict := anObject
]

{ #category : #initalize }
ASDForm >> initialize [

	super initialize.
	self isAjax: false.
	self withform: false.
	self withCard: false.
	self withPanel: false.
	self model isNil
		ifTrue: [ self labelAction: 'anlegen' ]
		ifFalse: [ self labelAction: 'bearbeiten' ]
]

{ #category : #accessing }
ASDForm >> isAjax [
	^ isAjax
]

{ #category : #accessing }
ASDForm >> isAjax: anObject [
	isAjax := anObject
]

{ #category : #accessing }
ASDForm >> labelAction [

	^ labelAction
]

{ #category : #accessing }
ASDForm >> labelAction: anObject [

	labelAction := anObject
]

{ #category : #accessing }
ASDForm >> labelSelf [

	^ labelSelf
]

{ #category : #accessing }
ASDForm >> labelSelf: anObject [

	labelSelf := anObject
]

{ #category : #accessing }
ASDForm >> model [
	^ model
]

{ #category : #accessing }
ASDForm >> model: anObject [
	model := anObject
]

{ #category : #accessing }
ASDForm >> onClickBlock [
	^ onClickBlock
]

{ #category : #accessing }
ASDForm >> onClickBlock: anObject [
	onClickBlock := anObject
]

{ #category : #rendering }
ASDForm >> renderAjaxButtonOn: html [
	html div
		class: 'mdl-typography--text-right';
		with: [ html mdlButton
				raised;
				rippleEffect;
				with: 'abbrechen'.
			html space.
			html mdlButton
				raised;
				primaryColor;
				beSubmit;
					bePush;
				onClick: self onClickBlock;
				with: 'speichern' ]
]

{ #category : #rendering }
ASDForm >> renderButtonOn: html [
	html div
		class: 'mdl-typography--text-right';
		with: [ html mdlButton
				raised;
				rippleEffect;
				beSubmit;
				callback: [ self answer: nil ];
				with: 'abbrechen'.
			html space.
			html mdlButton
				raised;
				primaryColor;
				beSubmit;
				callback: [ callback value: model ];
				with: 'ok' ]
]

{ #category : #rendering }
ASDForm >> renderContentOn: html [
self withform ifTrue: [ html
		form: [ self renderFieldsOn: html.
			self isAjax
				ifTrue: [ self renderAjaxButtonOn: html ]
				ifFalse: [ self renderButtonOn: html ] ] ] ifFalse: [ self renderFieldsOn: html. ]
	
]

{ #category : #rendering }
ASDForm >> renderFieldsOn: html [
self subclassResponsibility
	
]

{ #category : #actions }
ASDForm >> validateAndSave [
	
	self session model storeObject: self model
]

{ #category : #accessing }
ASDForm >> withCard [

	^ withCard
]

{ #category : #accessing }
ASDForm >> withCard: anObject [

	withCard := anObject
]

{ #category : #accessing }
ASDForm >> withPanel [

	^ withPanel
]

{ #category : #accessing }
ASDForm >> withPanel: anObject [

	withPanel := anObject
]

{ #category : #accessing }
ASDForm >> withform [
	^ withform
]

{ #category : #accessing }
ASDForm >> withform: anObject [
	withform := anObject
]
