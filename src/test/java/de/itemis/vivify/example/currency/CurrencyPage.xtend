package de.itemis.vivify.example.currency

import de.itemis.vivify.Template
import java.util.Currency

import static extension de.itemis.vivify.transformations.Transformations.*

class CurrencyPage extends Template {
	
	new(Iterable<Currency> currencies) {
		super("/layout.html")
		select(".main-content") =>  replaceContent(new CurrencyTable(currencies)) 
		select(".page-header") => text("CurrencyPage")
		select(".sidebar-left") => text("I could be your menu")
		select(".sidebar-right")
			=> sub [
				select(".sidebar-heading") => text("warning")
				select(".sidebar-content")
				=> text('''Did you know that currencies can 
				change their fraction digits without 
				introducing a new currency code?''')
				=> wrap("em")
			]
		select(".page-footer") => remove
	}
}