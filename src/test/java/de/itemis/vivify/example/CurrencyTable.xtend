package de.itemis.vivify.example

import de.itemis.vivify.Snippet
import java.util.Currency

import static extension de.itemis.vivify.transformations.Transformations.*
import static extension de.itemis.vivify.util.MoreIterables.*

class CurrencyTable extends Snippet {
	new(Iterable<Currency> currencies) {
		super("/currencies.html", "#currencies")
		transform => sub [
			select("tbody")
			=> replaceContent(
				currencies.toNodes[currency, i|
					if (i == 0) 
						new FirstRow(currency)
					else if (i % 2 == 0) 
						new EvenRow(currency) 
					else 
						new OddRow(currency)
				]
			)
		]
	}
}

abstract class Row extends Snippet {
	new(Currency currency, int indexOfSampleRow) {
		super("/currencies.html", '''#currencies tbody tr:eq(«indexOfSampleRow»)''')
		transform => sub [
			select("td:eq(0)") => text(currency.currencyCode)
			select("td:eq(1)") => text(currency.defaultFractionDigits.toString)
		]
	}
}

class FirstRow extends Row {
	new(Currency currency) {
		super(currency, 0)
	}
}

class OddRow extends Row {
	new(Currency currency) {
		super(currency, 1)
	}
}

class EvenRow extends Row {
	new(Currency currency) {
		super(currency, 2)
	}
}
