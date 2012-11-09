package de.itemis.vivify.transformations

import de.itemis.vivify.NodeLoader
import de.itemis.vivify.Transformation
import org.jsoup.nodes.Element

@Data
class Replacer implements Transformation {
	
	NodeLoader value

	override mould(Element context) {
		value.load(context.parent)
	}
	
}