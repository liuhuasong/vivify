package de.itemis.vivify.transformations

import de.itemis.vivify.NodeLoader
import de.itemis.vivify.Transformation
import org.jsoup.nodes.Element

import static extension de.itemis.vivify.util.JsoupExtensions.*
@Data
class Appender implements Transformation {
	
	private NodeLoader value 
	
	override mould(Element sibbling) {
		(newArrayList(sibbling) + value.load(sibbling.parent)).toList
	}
	
}