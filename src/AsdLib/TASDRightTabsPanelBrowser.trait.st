Trait {
	#name : #TASDRightTabsPanelBrowser,
	#category : #'AsdLib-Components'
}

{ #category : #accessing }
TASDRightTabsPanelBrowser >> browserClass [
	"I should return an html class specific to the browser to prefix generated ids and classes for the HTML."

	^ self explicitRequirement
]

{ #category : #components }
TASDRightTabsPanelBrowser >> defaultToolbar [
	^ self explicitRequirement
]

{ #category : #initialization }
TASDRightTabsPanelBrowser >> initializeRightPanel [
	self setDefaultRightPanel.
	self toolbar: self defaultToolbar
]

{ #category : #rendering }
TASDRightTabsPanelBrowser >> renderRightPanelOn: html [
	html render: self toolbar.
	html div
		id: self rightPanelId;
		class: #rightPanel;
		class: #toFold;
		shadow: 2;
		with: [ html render: MDLRightPanelResizer new.
			html render: self rightPanel ]
]

{ #category : #accessing }
TASDRightTabsPanelBrowser >> rightPanel [
	^ self explicitRequirement
]

{ #category : #accessing }
TASDRightTabsPanelBrowser >> rightPanel: aComponent [
	self explicitRequirement
]

{ #category : #accessing }
TASDRightTabsPanelBrowser >> rightPanelId [
	"I should return the id of the right panel of the browser."

	^ self browserClass , '-right-panel'
]

{ #category : #components }
TASDRightTabsPanelBrowser >> setDefaultRightPanel [
	self explicitRequirement
]

{ #category : #components }
TASDRightTabsPanelBrowser >> switcherButton: text id: anId tooltip: tooltip perform: method onCompleteHook: aString [
	^ (MDLPanelSwitcherButton
		text: text
		tooltip: tooltip
		panelId: self rightPanelId
		actionBlock: [ :r | 
			self perform: method.
			r render: MDLRightPanelResizer new.
			r render: self rightPanel ]
		onComplete: ('var button = $(this.parentNode).find(".fold-button"); if(button.attr("data-fold") == "true"){button.click()};componentHandler.upgradeDom();' , aString) js
		id: anId)
		isSelected: method = #setDefaultRightPanel;
		yourself
]

{ #category : #components }
TASDRightTabsPanelBrowser >> switcherButton: text perform: method [
	^ self switcherButton: text tooltip: nil perform: method
]

{ #category : #components }
TASDRightTabsPanelBrowser >> switcherButton: text tooltip: tooltip perform: method [
	^ self
		switcherButton: text
		tooltip: tooltip
		perform: method
		onCompleteHook: ''
]

{ #category : #components }
TASDRightTabsPanelBrowser >> switcherButton: text tooltip: tooltip perform: method onCompleteHook: aString [
	^ self
		switcherButton: text
		id: nil
		tooltip: tooltip
		perform: method
		onCompleteHook: aString
]

{ #category : #accessing }
TASDRightTabsPanelBrowser >> toolbar [
	^ self explicitRequirement
]

{ #category : #accessing }
TASDRightTabsPanelBrowser >> toolbar: aComponent [
	self explicitRequirement
]
