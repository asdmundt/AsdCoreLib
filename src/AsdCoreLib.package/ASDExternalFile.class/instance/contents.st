accessing
contents
	| contents |
	FileStream fileNamed: self filepath do: [ :stream |
		stream binary.
		contents := stream contents ].

	^ contents
