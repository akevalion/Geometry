Class {
	#name : #GTestCase,
	#superclass : #TestCase,
	#category : #'Geometry-Tests'
}

{ #category : #testing }
GTestCase class >> isAbstract [
	^ self = GTestCase
]

{ #category : #testing }
GTestCase class >> shouldInheritSelectors [
	^ true
]

{ #category : #asserting }
GTestCase >> assert: aCollection hasCloseElementsTo: anotherCollection [
	"Assertion pass if the collections have the same elements using the =~ comparaison operator."

	self
		assert: [ aCollection size = anotherCollection size and: [ aCollection allSatisfy: [ :each | anotherCollection anySatisfy: [ :expected | expected =~ each ] ] ] ]
		description:
			(String
				streamContents: [ :stream | 
					stream
						nextPutAll: 'Given Collections do not match!';
						lf;
						tab;
						nextPutAll: 'Expecting : ';
						print: anotherCollection asArray;
						lf;
						tab;
						nextPutAll: 'Got : ';
						print: aCollection asArray;
						lf ])
]