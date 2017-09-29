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
