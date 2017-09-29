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
