rendering
renderCardContentOn: html
	html mdlCard
		shadow: 2;
		mdlTypographyTextLeft;
		style: 'width: 100%; height: 100%;';
		with: [ html mdlCardTitleContainer
				"style: 'color: #fff; background: #3E4EB8;';"
				with: [ html mdlCardTitleText: self label level: 2 ].
			html mdlCardTextContainer
				with: [ "html mdlCardActions
				border;
				with: [ html mdlButton
						mdlTypographyFontBold;
						colored;
						rippleEffect;
						with: 'View Updates' ] " super renderContentOn: html ] ]