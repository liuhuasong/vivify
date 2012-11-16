package de.itemis.vivify;

import java.util.List;

import org.jsoup.nodes.Element;
import org.jsoup.nodes.Node;

/**
 * Transforms a DOM element into any number of DOM nodes. This could mean
 * manipulating attributes, wrapping the element, adding siblings or even
 * removing it altogether.
 * 
 * Transformations are strung together so that the result of the 
 * first transformation forms the input for the next one.
 */
public interface Transformation {
	/**
	 * The input element will be replaced with the resulting nodes.
	 * @return never null
	 */
	List<? extends Node> transform(Element input);
}
