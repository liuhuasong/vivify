package de.itemis.vivify.transformations

import de.itemis.vivify.Transformation
import java.util.Map
import org.jsoup.nodes.Element

import static extension de.itemis.vivify.util.JsoupExtensions.*

class SubMoulder implements Transformation {
	
	Map<String, Transformation> moulders = newHashMap()
	
	def select(String selector) {
		new MoulderChain => [
			moulders.put(selector, it)
		]
	}
	
	override mould(Element input) {
		moulders.forEach[selector, moulder|
			input.select(selector).forEach[
				replaceWith(moulder.mould(it))
			]
		]
		newArrayList(input)
	}
}