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

   def self.top_category
      self.all.each do |category|
        category.count.max
      end
    end
 end
  # - Category.find_or_create
  #   + This method takes in one argument, which is a string of the category name. The method should create
  #    a new instance of a category if one doesn't already exist. Otherwise, it should return the existing category instance.


end

# 2. Build Category and Article methods:
#
#   #### Category Class
#   - Category.all
#     + returns all categories. When a category is initialized, it should be added to
#     an array of all categories.
#   - Category.find_or_create
#     + This method takes in one argument, which is a string of the category name. The
#     method should create a new instance of a category if one doesn't already exist.
#      Otherwise, it should return the existing category instance.
