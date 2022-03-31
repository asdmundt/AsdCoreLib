"
MessageComonente um aktionen mitzuteilen
"
Class {
	#name : #ASDMessageComponent,
	#superclass : #WAComponent,
	#instVars : [
		'messageString',
		'messageType',
		'wasShown'
	],
	#category : #'AsdLib-Components'
}

{ #category : #'as yet unclassified' }
ASDMessageComponent >> errorMessage: aString [

 self
  messageString: aString;
  messageType: 'error';
  wasShown: false.
]

{ #category : #'as yet unclassified' }
ASDMessageComponent >> infoMessage: aString [

 self
  messageString: aString;
  messageType: 'info';
  wasShown: false.
]

{ #category : #initialize }
ASDMessageComponent >> initialize [

	super initialize.
	self wasShown: true.
]

{ #category : #accessing }
ASDMessageComponent >> messageString [
	^ messageString
]

{ #category : #accessing }
ASDMessageComponent >> messageString: anObject [
	messageString := anObject
]

{ #category : #accessing }
ASDMessageComponent >> messageType [
	^ messageType
]

{ #category : #accessing }
ASDMessageComponent >> messageType: anObject [
	messageType := anObject
]

{ #category : #'as yet unclassified' }
ASDMessageComponent >> renderContentOn: html [

	self wasShown ifTrue: [ ^ self ].
	html div
		style: 'width: 340px; height: 256px; ';
		class: self messageType , 'Message message';
		with: [ self messageString ].
	self wasShown: true
]

{ #category : #accessing }
ASDMessageComponent >> wasShown [
	^ wasShown
]

{ #category : #accessing }
ASDMessageComponent >> wasShown: anObject [
	wasShown := anObject
]
