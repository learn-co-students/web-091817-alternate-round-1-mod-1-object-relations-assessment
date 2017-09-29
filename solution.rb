# Please copy/paste require 'pry'
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

  def create_objects_from_file(file)
    self.articles.each do |file|
      Category.new(file[:category])
      Article.new(file[:title],  file[:description],  file[:url],  file[:contributor],  file[:time_published])
    end
  end
end
class Article
  attr_reader :name

  @@all = []

  def initialize(title,  description,  url,  contributor,  time_published)
    @title = title,
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
    self.all.select { |file| file[:category] == category }
  end


end
class Category
  attr_reader  name

  @@all = []

  def initialize (name)
    @name = name
    @@all << self
  end

  def self.all
    @@all
  end

  def self.find_or_create(name)
    self.all.find do |category|
      if category.name == name
        return category
      else
        Category.new(name)
      end
   end
 end

   def self.top_category
      self.all.each do |category|
        category.count.max
      end
    end

end
