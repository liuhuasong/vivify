package de.itemis.vivify.util

import com.google.common.base.Function
import com.google.common.collect.Iterables

import static extension de.itemis.vivify.util.MoreIterables.*

class MoreIterables {
	
	def static <T, R, S extends R> R myFold(Iterable<T> iterable, S seed, (R, T)=>R combinator) {
		var R result = seed;
		for (value: iterable){
			result = combinator.apply(result, value);
		}
		result;
	}
	
	def static <T, R> flatMapIndexed(Iterable<T> original, (T, Integer)=>Iterable<? extends R> transformation) {
		original.mapIndexed(transformation).flatten
	}
	
	def static <T, R> flatMap(Iterable<T> original, (T)=>Iterable<? extends R> transformation) {
		original.map(transformation).flatten
	}
	
	def static <T, R> mapIndexed(Iterable<T> original, (T, Integer)=>R transformation) {
		Iterables::transform(original, new CountingTransformation<T,R>(transformation))
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