Class {
	#name : #ASDForm,
	#superclass : #MDLHighLevelWidget,
	#instVars : [
		'model',
		'withform',
		'isAjax',
		'callback',
		'onClickBlock'
	],
	#category : #'AsdLib-Components'
}

{ #category : #'instance creation' }
ASDForm class >> withModel: aModel [
	^ self new
		model: aModel;
		withForm: false
]

{ #category : #'instance creation' }
ASDForm class >> withModel: aModel andForm: aBoolean [
	^ self new
		model: aModel;
		withForm: aBoolean
]

{ #category : #'instance creation' }
ASDForm class >> withModel: aModel andOnClickBlock: aBlock [
	^ self new
		model: aModel;
		onClickBlock: aBlock;
		isAjax: true;
		withForm: true
]

{ #category : #accessing }
ASDForm >> callback [
	^ callback
]

{ #category : #accessing }
ASDForm >> callback: anObject [
	callback := anObject
]

{ #category : #initalize }
ASDForm >> initialize [
	super initialize.
	self isAjax: false.
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
ASDForm >> withform [
	^ withform
]

{ #category : #accessing }
ASDForm >> withform: anObject [
	withform := anObject
]
