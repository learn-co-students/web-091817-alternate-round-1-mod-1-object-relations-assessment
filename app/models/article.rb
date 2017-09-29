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
