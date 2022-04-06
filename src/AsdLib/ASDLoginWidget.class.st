Class {
	#name : #ASDLoginWidget,
	#superclass : #MDLHighLevelWidget,
	#instVars : [
		'titleLabel',
		'titleLevel',
		'loginLabel',
		'passwordLabel',
		'login',
		'password',
		'submitLabel',
		'callback',
		'cancelLabel',
		'cancelCallback'
	],
	#category : #'AsdLib-Widget'
}

{ #category : #accessing }
ASDLoginWidget >> callback: anObject [
	callback := anObject
]

{ #category : #accessing }
ASDLoginWidget >> cancelCallback [
	^ cancelCallback ifNil: [ cancelCallback := [  ] ]
]

{ #category : #accessing }
ASDLoginWidget >> cancelCallback: anObject [
	cancelCallback := anObject
]

{ #category : #accessing }
ASDLoginWidget >> cancelLabel: anObject [
	cancelLabel := anObject
]

{ #category : #initialization }
ASDLoginWidget >> initialize [
	super initialize.
	titleLabel := 'Please, sign in'.
	titleLevel := 2.
	loginLabel := 'Login'.
	cancelLabel := 'Cancel'.
	passwordLabel := 'Password'.
	submitLabel := 'Sign In'
]

{ #category : #accessing }
ASDLoginWidget >> login [
	^ login
]

{ #category : #accessing }
ASDLoginWidget >> login: anObject [
	login := anObject
]

{ #category : #rendering }
ASDLoginWidget >> loginInputWidget [

	^ MDLTextFieldWidget new
		  on: #login of: self;
		style: 'width: 200px';
		  label: loginLabel;
		  yourself
]

{ #category : #accessing }
ASDLoginWidget >> loginLabel: anObject [
	loginLabel := anObject
]

{ #category : #accessing }
ASDLoginWidget >> password [
	^ password
]

{ #category : #accessing }
ASDLoginWidget >> password: anObject [
	password := anObject
]

{ #category : #rendering }
ASDLoginWidget >> passwordInputWidget [

	^ MDLTextFieldWidget new
		  type: 'password';
		  on: #password of: self;
		style: 'width: 200px';
		  label: passwordLabel;
		  yourself
]

{ #category : #accessing }
ASDLoginWidget >> passwordLabel: anObject [
	passwordLabel := anObject
]

{ #category : #rendering }
ASDLoginWidget >> renderCancelButtonOn: html [
	html anchor
		class: 'mdl-button mdl-js-button mdl-button--raised';
		callback: self cancelCallback;
		with: cancelLabel
]

{ #category : #rendering }
ASDLoginWidget >> renderContentOn: html [
	self renderFieldsOn: html.
	self renderCancelButtonOn: html.
	self renderSubmitButtonOn: html
]

{ #category : #rendering }
ASDLoginWidget >> renderFieldsOn: html [
	html render: self loginInputWidget.
	html render: self passwordInputWidget
]

{ #category : #rendering }
ASDLoginWidget >> renderSubmitButtonOn: html [
	html mdlButton
		raised;
		accentColor;
		beSubmit;
		callback: [ callback value: login value: password ];
		with: submitLabel
]

{ #category : #rendering }
ASDLoginWidget >> renderloginInputWidget: html [

	html mdlTextFieldContainer
		style: 'width: 200px';
		with: [ 
			html mdlTextFieldLabel
				for: html nextId;
				with: loginLabel.
			html mdlTextFieldInput
				id: html lastId;
				style: 'width: 200px';
				value: self login;
				callback: [ :aString | self login: aString ] ]
]

{ #category : #accessing }
ASDLoginWidget >> submitLabel: anObject [
	submitLabel := anObject
]

{ #category : #accessing }
ASDLoginWidget >> titleLabel: anObject [
	titleLabel := anObject
]

{ #category : #accessing }
ASDLoginWidget >> titleLevel: anObject [
	titleLevel := anObject
]
