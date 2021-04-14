Class {
	#name : #ASDMATinymceComponent,
	#superclass : #MDLMATextAreaComponent,
	#category : #'AsdLib-Components'
}

{ #category : #rendering }
ASDMATinymceComponent >> renderEditorOn: html [
	super renderEditorOn: html.
	html
		script:
			' tinymce.init({selector:''textarea#' , self labelId
				,
					' '',
		height: 500,
  plugins: [
    ''advlist autolink lists link charmap print preview anchor'',
    ''searchreplace visualblocks code fullscreen'',
    ''insertdatetime media table paste wordcount'',
  ],
  toolbar: ''insertfile undo redo | styleselect | bold italic | alignleft aligncenter alignright alignjustify | bullist numlist outdent indent | link'',
  content_style: ''body { font-family:Helvetica,Arial,sans-serif; font-size:14px }''});'
]
