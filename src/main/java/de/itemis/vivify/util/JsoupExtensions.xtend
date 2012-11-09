package de.itemis.vivify.util

import java.util.List
import org.jsoup.nodes.Element
import org.jsoup.nodes.Node
import org.jsoup.parser.Parser
import com.google.common.io.Resources
import com.google.common.base.Charsets

class JsoupExtensions {

	/**
	 * Creates a copy of the given element. The copy is not added to the element's DOM
	 */
	def static copy(Element e) {
		e.ownerDocument.createElement(e.tagName) => [
		    e.attributes.forEach(a|attr(a.key, a.value))
		    html(e.html)
		]
	}
	
	/**
	 * Removes the element from the DOM and inserts the given nodes in its place 
	 */
	def static replaceWith(Element element, List<? extends Node> nodes) { 
		nodes.forEach[n|element.before(n.outerHtml)]
		element.remove
	}
	
	/**
	 * Adds the nodes at the end of the children list of the element
	 */
	def static appendChildren(Element element, List<? extends Node> nodes) {
		nodes.forEach[n|element.appendChild(n)]
		element
	}
	
	/**
	 * Adds the nodes at the beginning of the children list of the element
	 */
	def static prependChildren(Element element, List<? extends Node> nodes) {
		nodes.reverse.forEach[n|element.prependChild(n)]
		element
	}
	/**
	 * Changes an attribute of the element. 
	 * If the given value is null, the attribute is deleted. 
	 * Otherwise the attribute is created if it does not exist 
	 * or updated if it is already present.
	 */
	def static setOrRemoveAttr(Element element, String attrName, String attrValue) {
		element => [
			if (attrValue == null)
				removeAttr(attrName)
			else
				attr(attrName, attrValue)
		]
	}
	
	def static loadDoc(String path) {
		val url = typeof(JsoupExtensions).getResource(path)
		Parser::parseBodyFragment(
			Resources::toString(url, Charsets::UTF_8), "#"
		)
	}
	
}