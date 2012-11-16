package de.itemis.vivify.example

import de.itemis.vivify.NodeLoader
import de.itemis.vivify.Template

import static de.itemis.vivify.transformations.Transformations.*

class LayoutPage extends Template {
	
	new(NodeLoader content) {
		super("/layout.html")
		select(".main-content") => replaceContent(content) 
	}
}