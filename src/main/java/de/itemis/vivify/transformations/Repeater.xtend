package de.itemis.vivify.transformations

import de.itemis.vivify.Transformation
import org.jsoup.nodes.Element

import static extension de.itemis.vivify.util.MoreIterables.*
import static extension de.itemis.vivify.util.JsoupExtensions.*

@Data
class Repeater<T> implements Transformation {
	Iterable<T> values
	(T, int)=>Transformation moulders
	
	override mould(Element input) {
		values.flatMapIndexed[T v, i|
			val moulder = moulders.apply(v, i)
			moulder.mould(input.copy)
		].toList
	}
}