json
jsonOn: aStream
	"Alternatively could use Magritte Json integration.
	Describe the model with magritte, adding jsonName: calls
	For example:
	descriptionUrl
	^ MAStringDescription new
		accessor: (MAPluggableAccessor read: [ :model | model url greaseString ] write: [ :model :object | model url: object ]);
		jsonName: 'url';
		label: 'url';
		yourself"
		
	(Dictionary new
		at: #mimetype put: self mimetype;
		at: #filename put: self filename;	
		at: #filepath put: self filepath;
		at: #filesize put: self filesize;
		at: #url put: self url greaseString;
		yourself) jsonOn: aStream