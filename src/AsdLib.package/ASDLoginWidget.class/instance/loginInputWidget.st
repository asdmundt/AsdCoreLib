rendering
loginInputWidget
	^ MDLTextFieldWidget new
		beFloatingLabel;
		on: #benutzerName of: self;
		label: loginLabel;
		pattern: '^\S+$' errorMessage: 'kein leerstring';
		yourself