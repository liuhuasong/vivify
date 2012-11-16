package de.itemis.vivify.transformations

import de.itemis.vivify.Transformation
import java.util.Map
import org.jsoup.nodes.Element

import static extension de.itemis.vivify.util.JsoupExtensions.*

class SubTransformation implements Transformation {
	
	Map<String, Transformation> transformations = newHashMap()
	
	def select(CharSequence selector) {
		new TransformationChain => [
			transformations.put(selector.toString, it)
		]
	}
	
	override transform(Element input) {
		transformations.forEach[selector, transformation|
			input.select(selector).forEach[
				replaceWith(transformation.transform(it))
			]
		]
		newArrayList(input)
	}
}