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

	^ '.window {
    
    border: 1px solid #3d444d;
display: block; 
height: 100%; 
margin: 0px 0px 0px 0px; 
padding-left: 5px;
position:absolute; 
z-index:10; 
left:10px; 
top:10px; 
width:100%;
}

.window .window-titlebar {
    color: #444;
    padding: 5px;
    overflow: hidden;
    background-color: #eee;
    border-bottom: 1px solid #3d444d;
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
    background-color: #212830;
}
'
]

{ #category : #accessing }
ASDWindowDecoration >> title: aString [
	title := aString
]
