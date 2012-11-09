package de.itemis.vivify.transformations

import de.itemis.vivify.NodeLoader
import de.itemis.vivify.Transformation
import org.jsoup.nodes.Element

import static extension de.itemis.vivify.util.JsoupExtensions.*
@Data
class ChildPrepender implements Transformation {
	
	NodeLoader children 

	override mould(Element root) {
		newArrayList(root.prependChildren(children.load(root)))
	}
	
}