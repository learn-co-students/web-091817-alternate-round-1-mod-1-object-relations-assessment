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
