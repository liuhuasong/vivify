package de.itemis.vivify.example.enlive

import de.itemis.vivify.Snippet

import static de.itemis.vivify.example.enlive.AnimalRow.*
import static de.itemis.vivify.transformations.Transformations.*

class AnimalRow extends Snippet {
	
	new(Animal animal, int idx) {
		super("/animal/animal.html", ".per_animal_row")
		transform 
		=> sub [
			select("input.true_name") 
				=> newName("true_name",idx)
				=> attr("value", animal.trueName)
			select("input.species") 
				=> newName("species",idx)
				=> attr("value", animal.species)
			select("input.extra_display_info") 
				=> newName("extra_display_info",idx)
				=> attr("value", animal.extraDisplayInfo)
		] 
	}
	
	def private static newName(String name, int idx) {
		attr("name", '''animal«idx»_«name»''')
	}
}