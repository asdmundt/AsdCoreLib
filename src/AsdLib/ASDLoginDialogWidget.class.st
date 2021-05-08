Class {
	#name : #ASDLoginDialogWidget,
	#superclass : #MDLLoginWidget,
	#traits : 'TWithRootDialogComponent',
	#classTraits : 'TWithRootDialogComponent classTrait',
	#instVars : [
		'closeId',
		'openId',
		'signInTitleLabel',
		'signInButtonLabel'
	],
	#category : #'AsdLib-Widget'
}

{ #category : #accessing }
ASDLoginDialogWidget >> closeId [
	^ closeId
]

{ #category : #accessing }
ASDLoginDialogWidget >> closeId: anObject [
	^ closeId := anObject
]

{ #category : #initialization }
ASDLoginDialogWidget >> initialize [
	super initialize.
	signInTitleLabel := 'Sign In'.
	signInButtonLabel := 'Sign In'
]

{ #category : #accessing }
ASDLoginDialogWidget >> openId [
	^ openId
]

{ #category : #accessing }
ASDLoginDialogWidget >> openId: anObject [
	^ openId := anObject
]

{ #category : #rendering }
ASDLoginDialogWidget >> renderCancelButtonOn: html [
	html mdlButton
		id: closeId;
		raised;
		with: cancelLabel
]

{ #category : #rendering }
ASDLoginDialogWidget >> renderContentOn: html [
	
	self renderLoginDialogOn: html
]

{ #category : #rendering }
ASDLoginDialogWidget >> renderLoginDialogOn: html [
	html mdlDialog
		openButtonId: openId;
		closeButtonId: (closeId := html nextId);
		with: [ html mdlDialogTitle
				class: 'mdl-color--primary';
				with: signInTitleLabel.
			html mdlDialogContent: [ super renderContentOn: html ] ]
]

{ #category : #rendering }
ASDLoginDialogWidget >> renderOpenButtonOn: html [
	html mdlButton
		id: (openId := html nextId);
		raised;
		colored;
		rippleEffect;
		with: signInButtonLabel
]
