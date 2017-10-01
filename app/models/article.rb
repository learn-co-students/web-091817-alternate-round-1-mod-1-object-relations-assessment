class Article
    attr_accessor  :description,  :url,  :contributor,  :time_published, :category

  #copy & pasted something at some point and messed up my attrs! now fixed

  @@all = []

  def initialize(article, category)
    @title = article["title"]
    @description = article["description"]
    @url = article["url"]
    @contributor = article["contributor"]
    @time_published = article["publishedAt"]
    @category = article["category"]
    @@all << self
  end

  def self.all
    @@all
  end

  def self.find_all_by_category(category)
    self.all.select { |article| article.category == category }
  end


end
# 5. **Article Class:**
# - Article.find_all_by_category(category)
#   + Takes a category instance as an argument, and returns all articles associated with that category
#### Article Class:
