rendering
renderInputOn: html
| inputId |
	inputId := self labelId.
	html mdlTextFieldContainer
		style: 'display: block';
		floatingLabel;
		with: [ html mdlTextFieldLabel
				for: inputId;
				with: self magritteDescription label.
			html mdlTextFieldInput
				id: inputId;
				value: date;
		callback: [ :value | date := value ];
		script: (html jQuery new datepicker onSelect: html jQuery ajax serializeThis) ].
	