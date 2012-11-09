package de.itemis.vivify.transformations

import com.google.common.collect.Lists
import de.itemis.vivify.Transformation
import java.util.List
import org.jsoup.nodes.Element
import org.jsoup.nodes.Node

import static extension de.itemis.vivify.util.MoreIterables.*

class MoulderChain implements Transformation {
	List<Transformation> moulders
	
	new(List<Transformation> moulders) {
		this.moulders = Lists::newArrayList(moulders);
	}
	
	new(Transformation... moulders) {
		this(moulders.toList)
	}
	
	/**
	 * Adds the moulder at the end of the chain. 
	 * If the moulder is null, it will not be added. 
	 * This allows you to use if-expressions for optional moulds
	 */
	def operator_doubleArrow(Transformation moulder) {
		if (moulder != null) moulders.add(moulder)
		this
	}
	
	override mould(Element input) {
		moulders.myFold(newArrayList(input)) [nodes, moulder|
			nodes.flatMap[applyMoulder(moulder)].toList
		]
	}
	
	def dispatch applyMoulder(Node node, Transformation moulder) {
		newArrayList(node)
	}
	
	def dispatch applyMoulder(Element node, Transformation moulder) {
		moulder.mould(node)
	}
}