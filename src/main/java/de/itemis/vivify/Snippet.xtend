package de.itemis.vivify

import org.jsoup.nodes.Element

import static extension de.itemis.vivify.util.JsoupExtensions.*
import de.itemis.vivify.transformations.MoulderChain

abstract class Snippet implements NodeLoader {
	String path
	String selector
	MoulderChain moulder
	
	new(String path, CharSequence selector) {
		this.path = path
		this.selector = selector.toString
	}
	
	def protected mould() {
		moulder = new MoulderChain
	}
	
	override load(Element context) {
		val doc = path.loadDoc
		val elements = doc.select(selector)
		if (elements.size != 1) 
			throw new IllegalArgumentException("The selector of this snippet matches more than one element")
		moulder.mould(elements.first)
	}
}