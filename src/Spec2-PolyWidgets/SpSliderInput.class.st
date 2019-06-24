"
I am an elementary Spec Widget managing a slider and an input.

Self example

Between the bounds min and max of the slider, I ensure that the value of the input on the accept and the value of the slider are the same.

Note
====
- min and max must be set before use me.
- if autoAccept is true, the character '-' could create problems
"
Class {
	#name : #SpSliderInput,
	#superclass : #SpComposablePresenter,
	#instVars : [
		'slider',
		'input'
	],
	#category : #'Spec2-PolyWidgets-Elementary'
}

{ #category : #specs }
SpSliderInput class >> sliderBottom [
	<spec>
	^ SpBoxLayout newVertical
		add: #input withConstraints: [ :constraints | constraints height: self buttonHeight ];
		add: #slider;
		yourself
]

{ #category : #specs }
SpSliderInput class >> sliderLeft [
	<spec: #default>
	^ SpLayout composed
		newRow: [ :row | 
			row
				add: #slider origin: 0 @ 0 corner: 0.85 @ 1;
				add: #input origin: 0.85 @ 0 corner: 1 @ 1 ];
		yourself
]

{ #category : #specs }
SpSliderInput class >> sliderRight [
	<spec>
	^ SpLayout composed
		newRow: [ :row | 
			row
				add: #input origin: 0 @ 0 corner: 0.15 @ 1;
				add: #slider origin: 0.15 @ 0 corner: 1 @ 1 ];
		yourself
]

{ #category : #specs }
SpSliderInput class >> sliderTop [
	<spec>
	^ SpBoxLayout newVertical
		add: #slider;
		add: #input withConstraints: [ :constraints | constraints height: self buttonHeight ];
		yourself
]

{ #category : #accessing }
SpSliderInput >> autoAccept [
	^ input autoAccept
]

{ #category : #accessing }
SpSliderInput >> autoAccept: aBoolean [
	
	input autoAccept: aBoolean
]

{ #category : #initialization }
SpSliderInput >> initializePresenter [
	slider
		whenValueChangedDo: [ :sliderValue | 
			| inputValue |
			inputValue := input text asNumber.	" ifNotNil: [ :text | text asNumber ]"
			sliderValue == inputValue
				ifFalse: [ input text: sliderValue asString ] ].
	input
		whenTextChangedDo: [ :text | 
			| inputValue |
			inputValue := text asNumber.
			slider value == inputValue
				ifFalse: [ slider value: inputValue ] ]
]

{ #category : #initialization }
SpSliderInput >> initializeWidgets [
	slider := self instantiate: SpSliderPresenter.
	input := self instantiate: SpTextInputFieldPresenter.
	self focusOrder add: input
]

{ #category : #accessing }
SpSliderInput >> input [
	^ input
]

{ #category : #accessing }
SpSliderInput >> label [
	^ slider label
]

{ #category : #accessing }
SpSliderInput >> label: aString [
	slider label: aString
]

{ #category : #accessing }
SpSliderInput >> max: aNumber [
	slider max: aNumber
]

{ #category : #accessing }
SpSliderInput >> min: aNumber [
	slider min: aNumber.
	input text: aNumber asString 
]

{ #category : #accessing }
SpSliderInput >> slider [
	^ slider
]

{ #category : #accessing }
SpSliderInput >> value [
	^ slider value
]

{ #category : #accessing }
SpSliderInput >> value: aNumber [
	slider value: aNumber 
]

{ #category : #'api-events' }
SpSliderInput >> whenValueChangedDo: aBlock [
	slider whenValueChangedDo: aBlock
]