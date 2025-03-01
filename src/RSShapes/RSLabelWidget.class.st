Class {
	#name : #RSLabelWidget,
	#superclass : #RSWidget,
	#instVars : [
		'text'
	],
	#category : #'RSShapes-Widget-Display'
}

{ #category : #adding }
RSLabelWidget >> addOn: canvas [
	canvas addFixedShape: (self nodes first translateBy: self position; yourself)
]

{ #category : #building }
RSLabelWidget >> build [
	self add: (RSLabel new 
		color: Color black;
		text: text).
	self translateBy: self nodes first extent / 2.	
	"self padding: 1"
]

{ #category : #accessing }
RSLabelWidget >> text [

	^ text
]

{ #category : #accessing }
RSLabelWidget >> text: anObject [

	text := anObject
]
