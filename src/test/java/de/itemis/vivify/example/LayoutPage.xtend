package de.itemis.vivify.example

import de.itemis.vivify.NodeLoader
import de.itemis.vivify.Template

import static extension de.itemis.vivify.transformations.Transformations.*

class LayoutPage extends Template {
	
	new(NodeLoader content) {
		super("/layout.html")
		select(".main-content") =>  replaceContent(content) 
		select(".page-header") => text("CurrencyPage")
		select(".sidebar-left") => text("I could be your menu")
		select(".sidebar-right") 
			=> replaceContent("<em></em>".html)
			=> sub [
				it.select("em")
				=> text('''Did you know that currencies can 
				change their fraction digits without 
				introducing a new currency code?''')
				=> wrap("div")
			]
		select(".page-footer") => remove
	}
}