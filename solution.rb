# Please copy/paste all three classes into this file to submit your solution!
require 'pry'
require 'json'

# In terminal, you should be able to call Adapter.new('newyorker.json').create_objects_from_file and get the created Article objects as a return value

class Adapter
  attr_accessor :file, :articles

  def initialize(file)
    @file = file
    @articles = self.class.articles(file)
  end

  def self.articles(file)
    JSON.parse(File.read(file))
  end

  def create_objects_from_file
    self.articles.each do |article|
      Article.new(article["title"], article["description"], article["url"], article["contributor"], article["publishedAt"])
      # ^cycles through each element and creates an object for article with the correct information
      Category.new(article["category"]) #creates a Category object for each articles category
    end
  end

end
# ///////////////////////////////////////////////////////////////////
class Article

  attr_accessor :title, :description, :url, :contributor, :time_published

  @@all = []

  def initialize(title, description, url, contributor, time_published)
    @title = title
    @description = description
    @url = url
    @contributor = contributor
    @time_published = time_published
    @@all << self
  end


  def self.all
    @@all
  end

  def self.find_all_by_category(category)
    Category.all.each do |cat|
      binding.pry
      category == cat
    end
  end
  # Article.find_all_by_category(category)
    # + Takes a category instance as an argument, and
    # returns all articles associated with that category
# #<Category:0x007fd04f1aba90 @name="Technology">
end
# An article has a title, description, url, contributor, and time published
# ny = Adapter.new('newyorker.json')
# ny.create_objects_from_file

# ///////////////////////////////////////////////////////////////////
class Category

  attr_accessor :name

  @@all = []

  def initialize(name)
    @name = name
    @@all << self
  end

  def self.all
    @@all
  end

  def self.find_or_create(category_name)
    @@all.find do |object|  #checks and finds first instance of category
      if object.name == category_name #if the instance.name equals-
        object                        #the string passed in then it returns the object
      else                            #otherwise it creates a-
        Category.new(category_name)   #new instance of Category with the string name
      end
    end
  end

  def self.top_category
    categories = @@all.map do |category|
      category.name
    end
    hash = categories.inject(Hash.new(0)) { |total, e| total[e] += 1 ;total}
    hash.values.max
  end
end

# ///////////////////////////////////////////////////////////////////
