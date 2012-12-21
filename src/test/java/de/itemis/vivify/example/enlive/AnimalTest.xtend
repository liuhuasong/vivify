package de.itemis.vivify.example.enlive

import org.custommonkey.xmlunit.XMLUnit
import org.junit.Test

import static org.custommonkey.xmlunit.XMLAssert.*

import static extension de.itemis.vivify.util.JsoupExtensions.*

class AnimalTest {
	
	@Test
	def void generatesExpectedOutput() {
		val animals = newArrayList(
			new Animal("Horse","Equine","The thing you ride on"),
			new Animal("Cow","Bovine","The thing that gives you milk")
		)
		val document = new AnimalPage(animals).render
		val expected = "/animal/expectedOutput.html".loadDoc
		println(document)
		XMLUnit::setIgnoreWhitespace(true)
		assertXMLEqual(expected.html, document.html)
	}
}