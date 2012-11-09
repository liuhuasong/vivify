package de.itemis.vivify.transformations

import de.itemis.vivify.Transformation
import org.jsoup.nodes.Element
import de.itemis.vivify.Value

@Data
class Texter implements Transformation {
	Value<String> text
	
	override mould(Element input) { 
		newArrayList(input.text(text.get))
	}
	
}