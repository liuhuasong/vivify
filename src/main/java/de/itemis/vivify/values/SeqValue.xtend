package de.itemis.vivify.values

import java.util.Iterator
import de.itemis.vivify.Value

class SeqValue<T> implements Value<T> {
	
	val Iterator<T> iter
	
	new(Iterator<T> iter) {
		this.iter = iter
	}
	
	override get() {
		if (iter.hasNext) iter.next 
	}
}