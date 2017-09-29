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
# 5. **Article Class:**
# - Article.find_all_by_category(category)
#   + Takes a category instance as an argument, and returns all articles associated with that category
#### Article Class:
