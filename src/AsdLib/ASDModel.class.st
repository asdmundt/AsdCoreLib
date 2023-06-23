Class {
	#name : #ASDModel,
	#superclass : #Object,
	#instVars : [
		'status',
		'task',
		'states',
		'id',
		'dataModel',
		'bez',
		'userId',
		'displayString',
		'type',
		'types',
		'pathString',
		'stepIndex',
		'currentStepIndex'
	],
	#category : #'AsdLib-Model'
}

{ #category : #'instance creation' }
ASDModel class >> bez: aString [
^ self new
 bez: aString;
yourself 
]

{ #category : #accessing }
ASDModel class >> states [

	^ OrderedCollection newFrom:
		  { 'neu'. 'accepted'. 'inProgress'. 'success'. 'failure'. 'problem' }
]

{ #category : #accessing }
ASDModel >> bez [
	^ bez
]

{ #category : #accessing }
ASDModel >> bez: anObject [
	bez := anObject
]

{ #category : #accessing }
ASDModel >> currentStepIndex [

	^ currentStepIndex
]

{ #category : #accessing }
ASDModel >> currentStepIndex: anObject [

	currentStepIndex := anObject
]

{ #category : #accessing }
ASDModel >> dataModel [

	^ dataModel
]

{ #category : #accessing }
ASDModel >> dataModel: anObject [

	dataModel := anObject
]

{ #category : #accessing }
ASDModel >> displayString [

	^  String streamContents: [ :s | 
		  s
			  nextPutAll: self bez;
			  space;
			  nextPutAll: self status;
			  space
 ]
]

{ #category : #accessing }
ASDModel >> id [

	^ id
]

{ #category : #accessing }
ASDModel >> id: anObject [

	id := anObject
]

{ #category : #initalize }
ASDModel >> initialize [

	super initialize.
	self task: OrderedCollection new.
	self id: UUID new.
	self  stepIndex: 0.
	self currentStepIndex: 0.
	self status: 'new'
]

{ #category : #accessing }
ASDModel >> pathString [
^ String streamContents: [ :s | 
		  s
			  nextPutAll: '/';
			  space;
			  nextPutAll: self bez;
			  space ]
	
]

{ #category : #accessing }
ASDModel >> pathString: anObject [

	pathString := anObject
]

{ #category : #accessing }
ASDModel >> states [
	^ self class states
]

{ #category : #accessing }
ASDModel >> status [

	^ status
]

{ #category : #accessing }
ASDModel >> status: anObject [

	status := anObject
]

{ #category : #accessing }
ASDModel >> stepIndex [

	^ stepIndex
]

{ #category : #accessing }
ASDModel >> stepIndex: anObject [

	stepIndex := anObject
]

{ #category : #accessing }
ASDModel >> task [

	^ task
]

{ #category : #accessing }
ASDModel >> task: anObject [

	task := anObject
]

{ #category : #accessing }
ASDModel >> types [

	^ types
]

{ #category : #accessing }
ASDModel >> types: anObject [

	types := anObject
]

{ #category : #accessing }
ASDModel >> userId [

	^ userId
]

{ #category : #accessing }
ASDModel >> userId: anObject [

	userId := anObject
]
