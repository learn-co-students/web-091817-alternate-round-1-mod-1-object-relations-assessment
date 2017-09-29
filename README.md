# Object Relations Assessment

## Topics

+ Classes vs Instances
+ Variable Scope ( Class, Instance, Local )
+ Object Relationships
+ Arrays and Array Methods
+ Class Methods

For this assignment, we're going to be helping New Yorker Magazine organize its articles and categories for their new website. We'll create an adapter class to import json data and convert it into article and category class instances. **An article belongs to a category and a category can have many articles**

## Notes

We've provided you with a console that you can use to test your code. To enter a console session, run `ruby tools/console.rb`. You'll be able to test out the methods that you write here.

The idea of an Adapter class is that its responsibility is to take data in one format and translate it to another format that is easier for the programmer to work with.  Here, the job of our adapter class is to read in data from the given `newyorker.json` file and use that to create Ruby instances.

**To Submit** - once you've completed all the deliverables, please copy/paste your three class definitions into the `solution.rb` file. Please don't submit the lab until we give you the signal.

#### Instructions

The below are the methods that must be present on your models. Feel free to build out any helper methods, if needed.

1. Build the Article and Category classes and their associations. Write initialize methods for each.
   - A category has a name
   - An article has a title, description, url, contributor, and time published



**ONLY BEGIN STEPS 4 AND 5 AFTER COMPLETING THE ABOVE STEPS**
