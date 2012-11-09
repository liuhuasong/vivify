package de.itemis.vivify.transformations

import de.itemis.vivify.Transformation
import org.jsoup.nodes.Element

import static extension de.itemis.vivify.util.JsoupExtensions.*

@Data
class AttributeModifier implements Transformation {
	
	String name
	(String)=>String modifier

	override mould(Element input) {
		val old = input.attr(name)
		val updated = modifier.apply(old)
		input.setOrRemoveAttr(name, updated)
		newArrayList(input)
	}
	
}