package de.itemis.vivify.transformations

import de.itemis.vivify.Transformation
import org.jsoup.nodes.Element

import static extension de.itemis.vivify.util.JsoupExtensions.*

@Data
class AttributeModifier implements Transformation {
	
	CharSequence name
	(String)=>CharSequence modifier

	override transform(Element input) {
		val old = input.attr(name.toString)
		val updated = modifier.apply(old)
		input.setOrRemoveAttr(name.toString, updated.toString)
		newArrayList(input)
	}
	
}