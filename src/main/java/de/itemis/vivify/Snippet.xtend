package de.itemis.vivify

import de.itemis.vivify.transformations.TransformationChain
import org.jsoup.nodes.Element
import org.jsoup.select.Elements

import static extension de.itemis.vivify.util.JsoupExtensions.*

/**
 * A Snippet selects a small piece of HTML (taken from a document written by your web designer) 
 * and populates it with meaningful content, e.g. by setting attributes or text.
 */
abstract class Snippet implements NodeLoader {
	String path
	String selector
	TransformationChain chain
	
	/**
	 * Takes the path of the HTML document relative to this class and a selector that must select exactly one DOM element in that document.
	 */
	new(CharSequence path, CharSequence selector) {
		this.path = path.toString
		this.selector = selector.toString
	}
	
	/**
	 * Transform the DOM element matched by the given CSS selector
	 */
	def protected transform() {
		chain = new TransformationChain
	}
	
	override load(Element context) {
		val body = path.loadDoc.body
		val elements = body.select(selector)
		elements.checkExactlyOne
		chain.transform(elements.first)
	}
	
	def private checkExactlyOne(Elements elements) {
		if (elements.size < 1) 
			throw new IllegalArgumentException("The selector of this snippet does not match any elements")
		if (elements.size > 1) 
			throw new IllegalArgumentException("The selector of this snippet matches more than one element")
	}
}