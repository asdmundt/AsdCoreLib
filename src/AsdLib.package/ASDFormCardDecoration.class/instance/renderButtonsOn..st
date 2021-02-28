rendering
renderButtonsOn: html
	html div
		class: 'mdl-typography--text-right';
		with: [ self onClickJs
				ifNil: [ self buttons
						do: [ :each | 
							(each == buttons last
								ifTrue: [ html mdlButton
										raised;
										primaryColor ]
								ifFalse: [ html mdlButton ])
								style: 'margin: 5px;';
								accessKey: each value first;
								callback: [ self execute: each key ];
								text: each value ] ]
				ifNotNil: [ self buttons
						do: [ :each | 
							(each == buttons last
								ifTrue: [ html mdlButton
										raised;
										onClick: onClickJs ;
										primaryColor ]
								ifFalse: [ html mdlButton ])
								style: 'margin: 5px;';
								accessKey: each value first;
								
								"callback: [ self execute: each key ];"
								text: each value ] ] ]