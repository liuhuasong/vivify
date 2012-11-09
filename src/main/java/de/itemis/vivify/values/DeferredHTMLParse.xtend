package de.itemis.vivify.values

import org.eclipse.xtend.lib.Data
import org.jsoup.nodes.Element
import org.jsoup.parser.Parser
import de.itemis.vivify.NodeLoader
import de.itemis.vivify.Value

@Data
class DeferredHTMLParse implements NodeLoader{
	val Value<CharSequence> value

	override load(Element context) {
		Parser::parseFragment(value.get.toString, context, "#").immutableCopy
	}
	
}