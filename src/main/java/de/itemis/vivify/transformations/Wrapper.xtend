package de.itemis.vivify.transformations

import de.itemis.vivify.Transformation
import org.eclipse.xtend.lib.Data
import org.jsoup.nodes.Element

@Data
class Wrapper implements Transformation{
	private CharSequence tag

	override transform(Element input) {
		input.wrap('''<«getTag»></«getTag»>''')
		newArrayList(input)
	}
	
}