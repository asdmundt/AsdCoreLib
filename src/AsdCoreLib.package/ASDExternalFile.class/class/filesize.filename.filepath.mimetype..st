instance creation
filesize: filesize filename: filename filepath: filepath mimetype: mimetype
	^ self new
		filesize: filesize;
		filename: filename;
		filepath: filepath;
		mimetype: mimetype greaseString;
		yourself