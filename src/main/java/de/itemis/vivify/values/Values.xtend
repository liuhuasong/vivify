package de.itemis.vivify.values

import com.google.common.collect.Iterators
import de.itemis.vivify.Value

import static de.itemis.vivify.values.Values.*

class Values {
	
	def static <T> iterate(Iterable<T> values) {
		new SeqValue(values.iterator)
	}
	
	def static <T> cycle(Iterable<T> values) {
		new SeqValue(Iterators::cycle(values))
	}
	
	def static html(CharSequence value) {
		html([|value])
	}
	
	def static html(Value<CharSequence> value) {
		new DeferredHTMLParse(value)
	}
}