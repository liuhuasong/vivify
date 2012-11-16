package de.itemis.vivify.transformations

import de.itemis.vivify.Transformation
import org.jsoup.nodes.Element

@Data
class Nop implements Transformation {

	override transform(Element input) {
		newArrayList(input);
	}
}