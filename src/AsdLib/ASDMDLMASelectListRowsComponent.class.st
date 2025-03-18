Class {
	#name : #ASDMDLMASelectListRowsComponent,
	#superclass : #MASelectListRowsComponent,
	#category : #'AsdLib-Magritte'
}

{ #category : #'rendering-grouped' }
ASDMDLMASelectListRowsComponent >> renderEditorForGroupedOn: html [

	html select
		id: self labelId;
		dispatchCallback;
		size: self itemsDisplayed;
		with: [ self renderGroupsOn: html ]
]

{ #category : #rendering }
ASDMDLMASelectListRowsComponent >> renderEditorForUngroupedOn: html [

	html render: ((MDLSelectWidget
			  possibilities: self options
			  inputLabel: self magritteDescription label
			  labelBlock: [ :anOption | anOption ]
			  callback: [ :anOption | self magritteDescription accessor: anOption ]) id: self labelId)
]
