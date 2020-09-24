"
Unterklasse  für MAToManyRelationDescription für einen Material-Design Report
"
Class {
	#name : #MLDMAToManyRelationDescription,
	#superclass : #MAToManyRelationDescription,
	#category : #'AsdLib-Magritte'
}

{ #category : #accessing }
MLDMAToManyRelationDescription class >> defaultComponentClasses [
	^ Array with: MDLMAOneToManyComponent
]
