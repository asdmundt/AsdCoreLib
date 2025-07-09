Class {
	#name : #ASDBaseComponent,
	#superclass : #MDLWidget,
	#instVars : [
		'modelList',
		'report',
		'model'
	],
	#category : #'AsdLib-Components'
}

{ #category : #'instance creation' }
ASDBaseComponent class >> withModelList: aList [

	^ self new
		  modelList: aList
		  
]

{ #category : #actions }
ASDBaseComponent >> add [

self subclassResponsibility
]

{ #category : #hooks }
ASDBaseComponent >> children [ 
^ OrderedCollection with: self report 
]

{ #category : #hooks }
ASDBaseComponent >> clear [
	self report rowFilter: nil
]

{ #category : #actions }
ASDBaseComponent >> editModel: aModel [

self subclassResponsibility
]

{ #category : #hooks }
ASDBaseComponent >> filter [
	| filter |
	filter := self request: 'Ergmisse filtern'.
	self report rowFilter: [ :m |
		(self report columns collect: [ :col |
			col magritteDescription in: [ :desc | desc toString: (m readUsing: desc) ] ]) anySatisfy: [:filterValue | filterValue matches: filter ] ]
]

{ #category : #descriptions }
ASDBaseComponent >> filteredDescriptionsFrom: aPerson [
self subclassResponsibility
]

{ #category : #initialization }
ASDBaseComponent >> initialize [

	super initialize.

]

{ #category : #initialization }
ASDBaseComponent >> initializeReport [
	self report: (ASDMDLReport
			 rows: self modelList
			 description: (self filteredDescriptionsFrom: self model)).
	self report addColumn: (MACommandColumn new
			 addCommandOn: self selector: #viewModel: text: 'Ansehen';
			 addCommandOn: self selector: #editModel: text: 'Bearbeiten';
			 yourself)
]

{ #category : #accessing }
ASDBaseComponent >> model [

	^ model
]

{ #category : #accessing }
ASDBaseComponent >> model: anObject [

	model := anObject
]

{ #category : #accessing }
ASDBaseComponent >> modelList [

	^ modelList ifNil: [ OrderedCollection new ]
]

{ #category : #accessing }
ASDBaseComponent >> modelList: anObject [

	modelList := anObject
]

{ #category : #rendering }
ASDBaseComponent >> renderContentOn: html [
self modelList size < 1 ifTrue: [ 
	html heading: 'Hinzufügen'.
	#( add  )
		do: [ :symbol | html anchor on: symbol of: self ]
		separatedBy: [ html space ].
	 ] ifFalse: [ 
	html heading: 'Übersicht'.
	#( add filter clear )
		do: [ :symbol | html anchor on: symbol of: self ]
		separatedBy: [ html space ].
	html render: self report
	 ]
	
]

{ #category : #accessing }
ASDBaseComponent >> report [

	^ report
]

{ #category : #accessing }
ASDBaseComponent >> report: anObject [

	report := anObject
]

{ #category : #actions }
ASDBaseComponent >> viewModel: aModel [

	self call: (aModel asComponent
			 addDecoration: (ASDFormCardDecoration buttons: {(#cancel -> 'zurück')});
			 readonly: true;
			 yourself)
]
