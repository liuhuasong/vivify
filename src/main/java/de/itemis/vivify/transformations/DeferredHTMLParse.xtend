package de.itemis.vivify.transformations

import de.itemis.vivify.NodeLoader
import org.eclipse.xtend.lib.Data
import org.jsoup.nodes.Element
import org.jsoup.parser.Parser

@Data
class DeferredHTMLParse implements NodeLoader{
	val CharSequence value

	override load(Element context) {
		Parser::parseFragment(value.toString, context, "#").immutableCopy
	}
	
}