package de.itemis.vivify.transformations

import de.itemis.vivify.NodeLoader
import org.eclipse.xtend.lib.Data
import org.jsoup.nodes.Element

@Data
class ConcatLoader implements NodeLoader {
	val Iterable<? extends NodeLoader> loaders

	override load(Element context) {
		loaders.map[load(context)].flatten.toList
	}
	
}