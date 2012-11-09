package de.itemis.vivify.transformations

import de.itemis.vivify.Transformation
import de.itemis.vivify.NodeLoader
import java.util.Collections
import de.itemis.vivify.Value
import org.eclipse.xtext.xbase.lib.Procedures$Procedure1

import static de.itemis.vivify.transformations.Moulders.*

import static extension de.itemis.vivify.values.Values.*

class Moulders {
	def static repeatN(int n) {
		new Repeater(Collections::<Object>nCopies(n, null), [_, _| new Nop])
	}
	
	def static <T> repeat(Iterable<T> values, (T, int)=>Transformation moulders) {
		new Repeater<T>(values, moulders)
	}
	
	def static text(String text) {
		new Texter([|text])
	}
	
	def static text(Value<String> text) {
		new Texter(text)
	}
	
	def static sub(Procedures$Procedure1<SubMoulder> init) {
		new SubMoulder => (init)
	}
	
	def static append(NodeLoader value) {
		new Appender(value)
	}
	
	def static prepend(NodeLoader value) {
		new Prepender(value)
	}
	
	def static attr(String name, String value) {
		new AttributeModifier(name, [_|value])
	}
	
	def static attr(String name, (String)=>String modifier) {
		new AttributeModifier(name, modifier)
	}
	
	def static addClass(String className) {
		addClass([|className])
	}  
	
	def static addClass(Value<String> className) {
		new AttributeModifier("class", [cs|cs + " " + className.get])
	}
	
	def static removeClass(String className) {
		removeClass([|className])
	}  
	
	def static removeClass(Value<String> className) {
		new AttributeModifier("class", [cs|cs.replaceAll(className.get, "")])
	}
	
	def static appendChild(NodeLoader children) {
		new ChildAppender(children)
	}
	
	def static prependChild(NodeLoader children) {
		new ChildPrepender(children)
	}
	
	def static replaceContent(NodeLoader value) {
		new ContentReplacer(value)
	}
	
	def static replaceContent(Iterable<? extends NodeLoader> values) {
		new ContentReplacer(concat(values))
	}
	
	def static replace(NodeLoader value) {
		new Replacer(value)
	}
	
	def static remove() {
		new Remover
	}
	
	def static chain() {
		new MoulderChain
	}
	
	def static concat(Iterable<? extends NodeLoader> loaders) {
		new ConcatLoader(loaders)
	}
}