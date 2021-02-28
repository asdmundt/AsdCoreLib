rendering
renderContentOn: html
	html
		render:
			(MDLCardWidget new
				shadow: 1;
				class: 'mdl-card__login-widget';
				class:
					(properties
						at: #class:
						ifPresent: [ :aString | aString ]
						ifAbsent: [ '' ]);
				title: titleLabel level: titleLevel;
				addTextContainer: [ :canvas | canvas render: component ];
				yourself)