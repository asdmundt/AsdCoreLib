Class {
	#name : #ASDBaseComponent,
	#superclass : #MDLWidget,
	#instVars : [
		'modelList',
		'report'
	],
	#category : #'AsdLib-Components'
}

{ #category : #'instance creation' }
ASDBaseComponent class >> withModel: aModel [

	^ self new model: aModel; yourself 
]

{ #category : #'instance creation' }
ASDBaseComponent class >> withModelList: aList [
	^ self new
		  modelList: aList;
		  yourself
]

{ #category : #actions }
ASDBaseComponent >> add [

	| model |
	model := self call: (modelList first asComponent
			          addDecoration:
			(ASDFormCardDecoration
				buttons:
					{(#save -> 'OK').
					(#cancel -> 'Abbrechen')});
		addValidation;
		yourself).
	model isNil ifFalse: [ 
		self modelList add: model.
		self report refresh ]
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

	self call: (aModel asComponent
			 addDecoration:
			(ASDFormCardDecoration
				buttons:
					{(#save -> 'OK').
					(#cancel -> 'Abbrechen')});
		addValidation;
		yourself)
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
	self report: (ASDMDLReport
			 rows: self modelList
			 description: (self filteredDescriptionsFrom: self modelList first)).
	self report addColumn: (MACommandColumn new
			 addCommandOn: self selector: #viewModel: text: 'Ansehen';
			 addCommandOn: self selector: #editModel: text: 'Bearbeiten';
			 yourself)
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
	html heading: 'Übersicht'.
	#( add filter clear )
		do: [ :symbol | html anchor on: symbol of: self ]
		separatedBy: [ html space ].
	html render: self report
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
