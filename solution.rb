# Please copy/paste all three classes into this file to submit your solution!
class Category

  @@all = []

  attr_reader :name

  def initialize(name:)
    @name = name
    @@all << self
  end

  def self.all
    @@all
  end

  def self.find_or_create(category_name)
    find_category = self.all.find do |category|
      category_name == category.name
    end

    if find_category != nil
      return find_category
    else
      self.new(category_name)
    end
  end

  def self.top_category
    a = 0
    the_category = self.all.find do |category|
      if category.articles.count > a
        a = category.articles.count
      end
    end
    the_category
  end

end

class Article

  @@all = []

  attr_reader :title, :description, :url, :contributor, :time_published, category:

  def initialize(title:, description:, url:, contributor:, time_published:, category:)
    @title = title
    @description = description
    @url = url
    @contributor = contributor
    @time_published = time_published
    @category = category
    @@all << self
  end

  def self.all
    @@all
  end

  def self.find_all_by_category(category)
    self.all.select do |article|
      article.category == category
    end
  end

end

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
    articles.map do |article|
      Article.new(article[:title], article[:description], article[:url], article[:contributor], article[:time_published], article[:category])
      Category.find_or_create(article[:category])
    end
  end

end
