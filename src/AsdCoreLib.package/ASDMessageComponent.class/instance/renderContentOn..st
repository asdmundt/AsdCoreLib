rendering
renderContentOn: html
self wasShown
		ifTrue: [ ^ self ].
	html div
		style:
			'position: fixed;
    bottom: 0;
    left: 50%;
    cursor: default;
    z-index: 3;
    display: block;
    display: -webkit-flex;
    display: -ms-flexbox;
    display: flex;
    -webkit-justify-content: space-between;
    -ms-flex-pack: justify;
    justify-content: space-between;
    font-family: "Roboto","Helvetica","Arial",sans-serif;
    will-change: transform;
    -webkit-transform: translate(0,80px);
    transform: translate(0,80px);
    transition: transform .25s cubic-bezier(.4,0,1,1);
    transition: transform .25s cubic-bezier(.4,0,1,1),-webkit-transform .25s cubic-bezier(.4,0,1,1);
    pointer-events: none;
	background-color: ',self messageColor ,';';
		with: self messageString.
	self wasShown: true
	
	