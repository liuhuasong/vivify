package de.itemis.vivify.example

import java.util.Currency
import org.custommonkey.xmlunit.XMLUnit
import org.junit.Test

import static org.custommonkey.xmlunit.XMLAssert.*
import static extension de.itemis.vivify.util.JsoupExtensions.*

class VivifyTest {
	
	@Test
	def void generatesExpectedOutput() {
		val currencies = newArrayList("EUR".cur, "USD".cur, "JPY".cur)
		val table = new CurrencyTable(currencies)
		val document = new LayoutPage(table).render
		val expected = "/expectedOutput.html".loadDoc
		println(document)
		XMLUnit::setIgnoreWhitespace(true)
		assertXMLEqual(expected.html, document.html)
	}
	
	def cur(String code) {
		Currency::getInstance(code);
	}
}