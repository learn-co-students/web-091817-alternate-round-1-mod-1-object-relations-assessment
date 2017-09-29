class Category

  attr_accessor :name

  @@all = []

  def initialize(name)
    @name = name
    @@all << self
  end

  def self.all
    @@all
  end

  def self.find_or_create(category_name)
    @@all.find do |object|  #checks and finds first instance of category
      if object.name == category_name #if the instance.name equals-
        object                        #the string passed in then it returns the object
      else                            #otherwise it creates a-
        Category.new(category_name)   #new instance of Category with the string name
      end
    end
  end

  def self.top_category
    categories = @@all.map do |category|
      category.name
    end
    hash = categories.inject(Hash.new(0)) { |total, e| total[e] += 1 ;total}
    hash.values.max
  end
end
