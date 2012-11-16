Vivify
======

Vivify is a templating library inspired by [Enlive](https://github.com/cgrand/enlive). It is written in XTend, which makes integrating it into an existing
Java environment very easy. 


Vivify promotes a clean separation between web design and application development in a 2-step process: 

1. Your web designer devises HTML templates which can be viewed and thus easily verified in a browser. 
2. Using Vivify's base classes you create templates (for whole pages) and snippets (for reusable pieces) that populate the HTML with actual data

To fill in the data you can select HTML elements with CSS-like selectors and then transform them. This is done through Transformations, Vivifys third important concept.
Transformations take a DOM element and return any number of DOM nodes. This way you can manipulate an element, add sibblings or children or even remove it from the DOM completely. 
Transformations are chained so that the ouput of the first ist the input of the second etc.
As a bonus, Vivify will try its best to generate valid HTML. This means that any HTML parsing will be done in the context of the element that will later contain the parsed nodes. 
In order to support this behavior, there is the fourth and last concept of Vivify: The Nodeloader which takes a DOM element as a context and returns any number of nodes.

Vivify comes with the most common transformations as well as utility functions that make writing templates as terse and easy as possible. Have a look at the test folder for examples.