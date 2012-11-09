package de.itemis.vivify;

import java.util.List;

import org.jsoup.nodes.Element;
import org.jsoup.nodes.Node;

public interface Transformation{
	List<? extends Node> mould(Element input);
}
