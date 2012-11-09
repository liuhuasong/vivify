package de.itemis.vivify.transformations

import de.itemis.vivify.NodeLoader
import de.itemis.vivify.Transformation
import org.jsoup.nodes.Element

import static extension de.itemis.vivify.util.JsoupExtensions.*
@Data
class Prepender implements Transformation {
	
	NodeLoader value 

	override mould(Element sibbling) {
		(value.load(sibbling.parent) + newArrayList(sibbling)).toList
	}
	
}