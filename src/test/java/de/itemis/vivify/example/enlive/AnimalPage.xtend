package de.itemis.vivify.example.enlive

import de.itemis.vivify.Template
import static extension de.itemis.vivify.transformations.Transformations.*
class AnimalPage extends Template {
	
	new(Iterable<Animal> animals) {
		super("/layout.html")
		select(".main-content") => replaceContent(new AnimalForm(animals))
	}
}