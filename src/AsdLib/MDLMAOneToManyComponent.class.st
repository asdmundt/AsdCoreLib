Class {
	#name : #MDLMAOneToManyComponent,
	#superclass : #MAOneToManyComponent,
	#category : #'AsdLib-Magritte'
}

{ #category : #private }
MDLMAOneToManyComponent >> buildReport [
	^ (MDLMAReport rows: self value description: self reference)
		sortEnabled: self magritteDescription isOrdered not;
		yourself
]
