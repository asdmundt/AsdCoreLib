rendering
renderContentOn: html
html mdlGrid
	style: 'height: 700px;';
		with: [ html mdlCell
				class: 'grid-cell-demo';
				size: 3.
			html mdlCell
				class: 'grid-cell-demo';
				middle;
				size: 6;
				with: [ self renderCardContentOn: html ].
			html mdlCell
				class: 'grid-cell-demo';
				middle;
				size: 3 ]
 