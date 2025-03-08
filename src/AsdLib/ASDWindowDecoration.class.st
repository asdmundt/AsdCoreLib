Class {
	#name : #ASDWindowDecoration,
	#superclass : #WAWidgetDecoration,
	#instVars : [
		'title',
		'cssClass'
	],
	#category : #'AsdLib-Decorations'
}

{ #category : #'instance creation' }
ASDWindowDecoration class >> title: aTitle [
	^ self new
		title: aTitle;
		yourself
]

{ #category : #accessing }
ASDWindowDecoration >> cssClass: aString [
	cssClass := aString
]

{ #category : #testing }
ASDWindowDecoration >> isGlobal [
	^ true
]

{ #category : #rendering }
ASDWindowDecoration >> renderCloseButtonOn: html [
	html anchor
		title: 'Close';
		callback: [ self decoratedComponent answer: nil ];
		with: [ html html: '&times;' ]
]

{ #category : #rendering }
ASDWindowDecoration >> renderContentOn: html [
	html div class: 'window'; with: [
		html div class: 'window-titlebar'; with: [
			html div class: 'window-title'; class: cssClass; with: title.
			html div class: 'window-close'; with: [ self renderCloseButtonOn: html ] ].
		html div class: 'window-content'; with: [ self renderNextOn: html ] ]
]

{ #category : #css }
ASDWindowDecoration >> style [ 
^'.window {
    margin: 1em;
    border: 1px solid #aaa;
}

.window .window-titlebar {
    color: #444;
    padding: 5px;
    overflow: hidden;
    background-color: #eee;
    border-bottom: 1px solid #aaa;
}

.window .window-titlebar .window-title {
    float: left;
    font-weight: bold;
    padding-left: 20px;
}

.window .window-titlebar .window-close {
    float: right;
}

.window .window-titlebar .window-close a {
    color: #444;
    text-decoration: none;
}

.window .window-titlebar .window-close a:hover {
    color: #111;
}

.window .window-content {
    clear: both;
    padding: 2px;
    background-color: #fff;
}
'
]

{ #category : #accessing }
ASDWindowDecoration >> title: aString [
	title := aString
]
