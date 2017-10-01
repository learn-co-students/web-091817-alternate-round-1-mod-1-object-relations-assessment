class Category
  attr_reader :name

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

   def category_count
     $counts = {}
     categories = Articles.all.fetch{ |article| article.category }
     self.all.each do |category|
       count = categories.select.count { category == category.name }
       counts << "#{category}: #{count}"
     end
  end

   def self.top_category
     $counts.sort_by(values).max
   end

end
