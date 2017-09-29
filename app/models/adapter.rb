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

  def create_objects_from_file(file)
    self.articles.each do |file|
      Category.new(file[:category])
      Article.new(file[:title],  file[:description],  file[:url],  file[:contributor],  file[:time_published])
    end
  end
end


# 3. **Adapter Class:**
#    Adapter#create_objects_from_file
#    - This method should use the provided articles data to create Article and
 # Category objects. It should return the created instances.
 Pry.start
