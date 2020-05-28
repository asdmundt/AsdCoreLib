accessing
errorMessage: aString
	self
		messageString: aString;
		messageType: 'error';
		messageColor: '#e60016';
		wasShown: false