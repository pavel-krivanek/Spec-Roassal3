Class {
	#name : #RSRadioButton,
	#superclass : #RSCheckButton,
	#category : #'RSShapes-Widget-Buttons'
}

{ #category : #building }
RSRadioButton >> build [ 
	| g |
	g := RSGroup new.
	g add: self radioButton;
	add: self label.
	RSHorizontalLineLayout new gapSize: 3; on: g.
	customLocation 
		ifFalse: [ self padding: 1.
			self shapes: g ]
		ifTrue: [ self addAll: g ].
]

{ #category : #geometry }
RSRadioButton >> preferredSizeMinimum [ 
	^ 81@22
]

{ #category : #'instance creation' }
RSRadioButton >> radioButton [
	| block cb icon |
	block := [ :bool | RSBitmap new form: (self iconNamed: (bool ifTrue: [ #radioButtonSelected ] ifFalse: [ #radioButtonUnselected ])) ].
	icon := block value: active.
	cb := { icon } asShape.
	cb when: RSMouseClick do: [ :evt | 
		active := active not.
		cb nodes do: #remove.
		cb add: (block value: active).
		evt signalUpdate ].
	^ cb
]
