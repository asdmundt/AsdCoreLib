Class {
	#name : #ASDForm,
	#superclass : #MDLHighLevelWidget,
	#instVars : [
		'model',
		'display',
		'dom',
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
		display: false
]

{ #category : #'instance creation' }
ASDForm class >> withModel: aModel andDom: aDom [
	^ self new
		model: aModel;
		dom: aDom;
		display: false
]

{ #category : #'instance creation' }
ASDForm class >> withModel: aModel andOnClickBlock: aBlock [
	^ self new
		model: aModel;
		onClickBlock: aBlock;
		isAjax: true
]

{ #category : #'instance creation' }
ASDForm class >> withModel: aModel asDisplay: aBoolean [ 
	^ self new
		model: aModel;
		display: aBoolean;
		yourself
]

{ #category : #'instance creation' }
ASDForm class >> withModel: aModel withAjax: aBoolean [
	^ self new
		model: aModel;
		isAjax: aBoolean
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
ASDForm >> display [
	^ display
]

{ #category : #accessing }
ASDForm >> display: anObject [
	display := anObject
]

{ #category : #accessing }
ASDForm >> dom [
	^ dom
]

{ #category : #accessing }
ASDForm >> dom: anObject [
	dom := anObject
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
html form: [
	self renderFieldsOn: html.
	self isAjax
		ifTrue: [ self renderAjaxButtonOn: html ]
		ifFalse: [ self renderButtonOn: html ]]
]

{ #category : #rendering }
ASDForm >> renderFieldsOn: html [
self subclassResponsibility
	
]

{ #category : #actions }
ASDForm >> validateAndSave [
	
	self session model storeObject: self model
]
