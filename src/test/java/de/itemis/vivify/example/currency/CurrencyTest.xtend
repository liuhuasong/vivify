package de.itemis.vivify.example.currency

import java.util.Currency
import org.custommonkey.xmlunit.XMLUnit
import org.junit.Test

import static org.custommonkey.xmlunit.XMLAssert.*

import static extension de.itemis.vivify.util.JsoupExtensions.*

class CurrencyTest {
	
	@Test
	def void generatesExpectedOutput() {
		val currencies = newArrayList("EUR".cur, "USD".cur, "JPY".cur)
		val document = new CurrencyPage(currencies).render
		val expected = "/currency/expectedOutput.html".loadDoc
		println(document)
		XMLUnit::setIgnoreWhitespace(true)
		assertXMLEqual(expected.html, document.html)
	}
	
	def cur(String code) {
		Currency::getInstance(code);
	}
}