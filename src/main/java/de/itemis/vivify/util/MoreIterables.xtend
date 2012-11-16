package de.itemis.vivify.util

import com.google.common.base.Function
import com.google.common.collect.Iterables

import static extension de.itemis.vivify.util.MoreIterables.*

/**
 * Some Iterable extensions that XTend is currently missing. 
 * This class is an internal implementation detail. 
 * XTend will most probably support these functions in the future, making this class obsolete. 
 */
class MoreIterables {
	
	/**
	 * The default fold()-function is currently broken due to a type inference bug. 
	 */
	def static <T, R, S extends R> R myFold(Iterable<T> iterable, S seed, (R, T)=>R combinator) {
		var R result = seed;
		for (value: iterable){
			result = combinator.apply(result, value);
		}
		result;
	}

	/**
	 * Works just like IterableExtensions#map, 
	 * but gives you the index of the element currently being processed
	 */	
	def static <T, R> mapIndexed(Iterable<T> original, (T, Integer)=>R transformation) {
		Iterables::transform(original, new CountingTransformation<T,R>(transformation))
	}

	/**
	 * A shortcut for the often used map().flatten() when processing nested Iterables
	 */
	def static <T, R> flatMap(Iterable<T> original, (T)=>Iterable<? extends R> transformation) {
		original.map(transformation).flatten
	}
	
	/**
	 * A shortcut for the often used mapIndexed().flatten() when processing nested Iterables
	 */
	def static <T, R> flatMapIndexed(Iterable<T> original, (T, Integer)=>Iterable<? extends R> transformation) {
		original.mapIndexed(transformation).flatten
	}
}

class CountingTransformation<S,T> implements Function<S,T> {
	(S, int ) => T delegate
	int i = 0;
	
	new((S, int ) => T delegate) {
		this.delegate = delegate		
	}

	override apply(S input) {
		val result = delegate.apply(input, i)
		i = i + 1
		result
	}
	
}