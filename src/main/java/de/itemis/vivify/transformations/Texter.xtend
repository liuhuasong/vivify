package de.itemis.vivify.transformations

import de.itemis.vivify.Transformation
import org.eclipse.xtend.lib.Data
import org.jsoup.nodes.Element

@Data
class Texter implements Transformation {
	CharSequence text
	
	override transform(Element input) { 
		newArrayList(input.text(text.toString))
	}
	
}