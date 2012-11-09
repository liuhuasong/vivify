package de.itemis.vivify

import de.itemis.vivify.transformations.SubMoulder
import org.jsoup.nodes.Document

import static extension de.itemis.vivify.util.JsoupExtensions.*

abstract class Template {
	val String path
	val moulder =new SubMoulder
	
	new(String path) {
		this.path = path
	}
	
	def protected select(String selector) {
		moulder.select(selector)
	}
	
	def Document render() {
		val doc = path.loadDoc
		moulder.mould(doc)
		doc
	}
	
}