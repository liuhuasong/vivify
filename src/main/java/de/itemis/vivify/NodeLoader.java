package de.itemis.vivify;

import java.util.List;

import org.jsoup.nodes.Element;
import org.jsoup.nodes.Node;

/**
 * A {@link NodeLoader} can generate DOM nodes, given a DOM element as a parsing
 * context. This context ensures that only valid DOMs can be constructed.
 */
public interface NodeLoader {
	/**
	 * Uses the given {@link Element} as a parsing context to construct DOM
	 * nodes. This could mean anything from parsing a String into HTML to maybe
	 * just returning a fixed set of nodes and ignoring the context altogether.
	 */
	List<? extends Node> load(Element context);
}
