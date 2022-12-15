Class {
	#name : #ASDComponentWithRightPanel,
	#superclass : #MDLWidget,
	#instVars : [
		'component'
	],
	#category : #'AsdLib-Components'
}

{ #category : #'instance creation' }
ASDComponentWithRightPanel class >> withComponent: aComponent [

	^ self new component: aComponent;
		  yourself
]

{ #category : #accessing }
ASDComponentWithRightPanel >> component [

	^ component
]

{ #category : #accessing }
ASDComponentWithRightPanel >> component: anObject [

	component := anObject
]

{ #category : #initialization }
ASDComponentWithRightPanel >> initialize [

	super initialize.
	self id: #mySidenav.
	
]

{ #category : #rendering }
ASDComponentWithRightPanel >> renderContentOn: html [

	html div
		id: self id;
		class: 'sidenav';
		with: [ html render: component  ]
]

{ #category : #hooks }
ASDComponentWithRightPanel >> script [

	^ '$(document).ready(function(){
  $(".openNav").click(function(){
		if($("#mySidenav").css("width") == "0px"){
    		$("#mySidenav").css("width", "450px");
    		//$("#main").css("margin-right", "350px");
		} else{
    		$("#mySidenav").css("width", "0px");
    		//$("#main").css("margin-right", "0px");
		}
  });
$(".closeNav").click(function(){
    $("#mySidenav").css("width", "0px");
    $("#main").css("margin-right", "0px");
  });
});'
]

{ #category : #hooks }
ASDComponentWithRightPanel >> style [

	^ '.sidenav {
  height: 95%;
  width: 0;
  position: fixed;
  z-index: 100;
  top: 0;
  right: 0;
  background-color: #161b22;
  overflow-x: hidden;
  transition: 0.5s;
  padding-top: 60px;
}

.sidenav a {
  padding: 8px 8px 8px 32px;
  text-decoration: none;
  font-size: 25px;
  color: #818181;
  display: block;
  transition: 0.3s;
}

.sidenav a:hover {
  color: #f1f1f1;
}

.sidenav .closebtn {
  position: absolute;
  top: 0;
  right: 25px;
  font-size: 36px;
  margin-left: 50px;
}

#main {
  transition: margin-right .5s;
  padding: 16px;
}

@media screen and (max-height: 450px) {
  .sidenav {padding-top: 15px;}
  .sidenav a {font-size: 18px;}
}'
]
