package de.itemis.vivify.transformations

import com.google.common.collect.Lists
import de.itemis.vivify.Transformation
import java.util.List
import org.jsoup.nodes.Element
import org.jsoup.nodes.Node

import static extension de.itemis.vivify.util.MoreIterables.*

class TransformationChain implements Transformation {
	List<Transformation> transformations
	
	new(List<Transformation> transformations) {
		this.transformations = Lists::newArrayList(transformations);
	}
	
	new(Transformation... transformations) {
		this(transformations.toList)
	}
	
	/**
	 * Adds the transformation at the end of the chain. 
	 * If the transformation is null, it will not be added. 
	 * This allows you to use if-expressions for optional transformations
	 */
	def operator_doubleArrow(Transformation transformation) {
		if (transformation != null) transformations.add(transformation)
		this
	}
	
	override transform(Element input) {
		transformations.myFold(newArrayList(input)) [nodes, transformation|
			nodes.flatMap[applyTransformation(transformation)].toList
		]
	}
	
	def dispatch applyTransformation(Node node, Transformation transformation) {
		newArrayList(node)
	}
	
	def dispatch applyTransformation(Element node, Transformation transformation) {
		transformation.transform(node)
	}
}