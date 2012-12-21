package de.itemis.vivify.example.enlive

import de.itemis.vivify.Snippet
import static extension de.itemis.vivify.transformations.Transformations.*

class AnimalForm extends Snippet{
	
	new(Iterable<Animal> animals) {
		super("/animal/animal.html", "body")
		transform 
		=> sub [
			select(".per_animal_row") => replace(
				animals.toNodes[animal,i|new AnimalRow(animal, i)]
			)
		]
	}
}