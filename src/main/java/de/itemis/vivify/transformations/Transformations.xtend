package de.itemis.vivify.transformations

import de.itemis.vivify.NodeLoader
import org.eclipse.xtext.xbase.lib.Procedures$Procedure1

import static de.itemis.vivify.transformations.Transformations.*

import static extension de.itemis.vivify.util.MoreIterables.*

class Transformations {

	/**
	 * Changes the contained text of a node
	 */	
	def static text(CharSequence text) {
		new Texter(text)
	}
	
	/**
	 * Allows you to find sub elements with CSS selectors and then transform them. 
	 */
	def static sub(Procedures$Procedure1<SubTransformation> init) {
		new SubTransformation => (init)
	}
	
	/**
	 * Adds sibling nodes after the current element
	 */
	def static append(NodeLoader value) {
		new Appender(value)
	}
	
	/**
	 * Adds sibling nodes before the current element
	 */
	def static prepend(NodeLoader value) {
		new Prepender(value)
	}
	
	/*
	 * Sets the attribute to the given value
	 */
	def static attr(CharSequence name, CharSequence value) {
		new AttributeModifier(name, [_|value])
	}
	
	/**
	 * Sets the current element's id attribute
	 */
	def static id(CharSequence value) {
		new AttributeModifier("id", [_|value])
	}
	
	/**
	 * Modifies an attribute with the given function
	 */
	def static attr(CharSequence name, (String)=>CharSequence modifier) {
		new AttributeModifier(name, modifier)
	}
	
	/**
	 * Adds a class to the current element if it is not already present
	 */
	def static addClass(CharSequence className) {
		new AttributeModifier("class", [cs|cs + " " + className])
	}
	
	/**
	 * Removes a class from the current element if it has that class
	 */
	def static removeClass(CharSequence className) {
		new AttributeModifier("class", [cs|cs.replaceAll(className.toString, "")])
	}
	
	/**
	 * Adds the given nodes at the end of the current element's children
	 */
	def static appendChild(NodeLoader children) {
		new ChildAppender(children)
	}
	
	/**
	 * Adds the given nodes at the beginning of the current element's children
	 */
	def static prependChild(NodeLoader children) {
		new ChildPrepender(children)
	}
	
	/**
	 * Replaces the children of this element with the given nodes. This will be used
	 * quite often to throw away demo content from a HTML snippet and insert the actual
	 * content.
	 */
	def static replaceContent(NodeLoader value) {
		new ContentReplacer(value)
	}
	
	/**
	 * Replaces this element with the given nodes
	 */
	def static replace(NodeLoader value) {
		new Replacer(value)
	}
	
	/**
	 * Removes this element from the DOM
	 */
	def static remove() {
		new Remover
	}
	
	/**
	 * Concatenates the results of several node loaders into one flat list of nodes
	 */
	def static concat(Iterable<? extends NodeLoader> loaders) {
		new ConcatLoader(loaders)
	}
	
	/**
	 * Parses the given text as HTML
	 */
	def static html(CharSequence value) {
		new DeferredHTMLParse(value)
	}
	
	/**
	 * Allows you transform many objects into DOM nodes, 
	 * probably using different snippets depending on the object itself 
	 * or its index in the iterable.
	 */
	def static <T> toNodes(Iterable<T> input, (T, int) => NodeLoader transformation) {
		concat(input.mapIndexed(transformation))
	}
}