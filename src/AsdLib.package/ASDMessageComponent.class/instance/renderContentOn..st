as yet unclassified
renderContentOn: html

 self wasShown ifTrue: [^ self].
 html div
  class: self messageType, 'Message';
  with: self messageString.
 self wasShown: true.