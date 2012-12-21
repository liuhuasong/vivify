package de.itemis.vivify

import de.itemis.vivify.transformations.SubTransformation
import org.jsoup.nodes.Document

import static extension de.itemis.vivify.util.JsoupExtensions.*

/**
 * A template takes a whole HTML document (writtin by your web designer) 
 * and transforms it in order to add meaningful content.
 */
abstract class Template {
	val String path
	val transformation =new SubTransformation
	
	/**
	 * Takes the path to the document relative to this class
	 */
	new(String path) {
		this.path = path
	}
	
	/**
	 * Selects all DOM elements matched by the CSS selector and allows you to transform them
	 */
	def protected select(CharSequence selector) {
		transformation.select(selector)
	}
	
	/**
	 * Reads the document, transforms it and then returns it for further processing
	 */
	def Document render() {
		val doc = path.loadDoc
		transformation.transform(doc)
		doc
	}
	
}