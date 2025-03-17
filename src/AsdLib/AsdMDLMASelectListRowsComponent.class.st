Class {
	#name : #AsdMDLMASelectListRowsComponent,
	#superclass : #MASelectListRowsComponent,
	#category : #'AsdLib-Magritte'
}

{ #category : #'rendering-grouped' }
AsdMDLMASelectListRowsComponent >> renderEditorForGroupedOn: html [

	html select
		id: self labelId;
		dispatchCallback;
		size: self itemsDisplayed;
		with: [ self renderGroupsOn: html ]
]

{ #category : #rendering }
AsdMDLMASelectListRowsComponent >> renderEditorForUngroupedOn: html [
	html
		render:
			((MDLSelectWidget
				possibilities: self options
				inputLabel: self magritteDescription label
				labelBlock: [ :anOption | anOption ]
				callback: [ :anOption | 1 halt ]) id: self labelId)
]
