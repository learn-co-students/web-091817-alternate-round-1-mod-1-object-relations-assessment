# Please copy/paste require 'pry'
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

class Article
  attr_reader :title
  attr_accessor  :description,  :url,  :contributor,  :time_published

  #copy & pasted something at some point and messed up my attrs! now fixed

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
 end

   def self.top_category
      self.all.each do |category|
        category.count.max
      end
    end
## see below correct method

  def self.top_category
    counts = []
    self.each do |category|
    articles = Article.find_all_by_category(category)
    counts << articles.count
    article_counts = articles.zip(counts
    article_counts.sort.last
  end
[
  {
  "contributor": "Aya Greene",
  "title": "Facebook teams with Harvard to defend democracy from hackers",
  "description": "Facebook announced today it would fund a project called Defending Digital Democracy. The project, co-founded by the campaign managers for both Hillary Clinton and Mitt Romney, aims ...",
  "url": "https://thenextweb.com/facebook/2017/07/26/facebook-teams-with-harvard-to-defend-democracy-from-hackers/",
  "publishedAt": "2017-07-26T20:08:07Z",
  "category": "Technology"
},
  {
  "contributor": "Owen Williams",
  "title": "Windows 95 running natively in your browser is a sight to behold",
  "description": "That Windows 95 startup sound always gives me nostalgia, but how about taking it for a whirl without setting anything up whatsoever?\r\n\r\nAndrea Faulds, a 19-year-old developer in Scotland, ...",
  "url": "https://thenextweb.com/apps/2017/07/26/what-a-time-to-be-alive-2/",
  "publishedAt": "2017-07-26T19:21:39Z",
  "category": "Technology"
  },
  {
  "contributor": "Aya Greene",
  "title": "Teaching the Google Generation",
  "description": "A few years ago I was lucky enough to attend a conference that was hosted at Google’s offices in Mountain View. At one point we were led on a tour of the major buildings.  In the ...",
  "url": "https://thenextweb.com/contributors/2017/07/26/teaching-google-generation/",
  "publishedAt": "2017-07-26T19:05:36Z",
  "category": "Business"
  },
  {
  "contributor": "Aya Greene",
  "title": "Google just killed off one of its biggest features – and you won’t even notice",
  "description": "Google Search just killed off Instant, one of the most unique features of its search engine - and one you probably never really used.\r\n\r\nFor those not familiar with the nomenclature, ...",
  "url": "https://thenextweb.com/google/2017/07/26/google-just-killed-off-one-biggest-features-wont-even-notice/",
  "publishedAt": "2017-07-26T18:01:08Z",
  "category": "Technology"
  },
  {
  "contributor": "Napier Lopez",
  "title": "Why this wedding industry disruptor is taking a personalized approach to customer service",
  "description": "If you’re married or have ever been part of a wedding-planning process, you know that the lead-up to the walk down the aisle is equal parts exciting and stressful. Couples, and their ...",
  "url": "https://thenextweb.com/contributors/2017/07/26/wedding-industry-disruptor-taking-personalized-approach-customer-service/",
  "publishedAt": "2017-07-26T17:40:11Z",
  "category": "Business"
  },
  {
  "contributor": "Abhimanyu Ghoshal",
  "title": "This smart cross-trainer works your ass off for the right to watch Netflix",
  "description": "Is your lackadaisical Netflix and Chill routine preventing you from keeping an active and healthy lifestyle? Then the Cycflix might be what you need.\r\n\r\nDeveloped by engineering student ...",
  "url": "https://thenextweb.com/shareables/2017/07/26/netflix-cross-trainer-tv-workout/",
  "publishedAt": "2017-07-26T13:52:51Z",
  "category": "Health"
  },
  {
  "contributor": "Abhimanyu Ghoshal",
  "title": "Canada revokes Helmut Oberlander's citizenship for the fourth time",
  "description": "Canada says it does not take revocation lightly but it is necessary in cases of fraud.",
  "url": "http://www.bbc.co.uk/news/world-us-canada-40719927",
  "publishedAt": "2017-07-26T16:33:43Z",
  "category": "World"
  },
  {
  "contributor": "Napier Lopez",
  "title": "Reality Check: Is Trump right that US has highest taxes?",
  "description": "Reality Check examines Donald Trump's claim that the US has the highest taxes in the world.",
  "url": "http://www.bbc.co.uk/news/world-us-canada-40728560",
  "publishedAt": "2017-07-26T14:48:16Z",
  "category": "Politics"
  },
  {
  "contributor": "Abhimanyu Ghoshal",
  "title": "Man arrested after live cobras found inside potato chip cans",
  "description": "A California man is charged with smuggling after the snakes were intercepted by customs officers.",
  "url": "http://www.bbc.co.uk/news/world-us-canada-40733372",
  "publishedAt": "2017-07-26T17:30:06Z",
  "category": "Weird"
  },
  {
  "contributor": "Abhimanyu Ghoshal",
  "title": "Canada's Supreme Court halts seismic testing near Inuit hamlet",
  "description": "The highest court ruled that the community was not adequately consulted on the oil and gas project.",
  "url": "http://www.bbc.co.uk/news/world-us-canada-40677578",
  "publishedAt": "2017-07-26T18:39:59Z",
  "category": "Politics"
  },
  {
  "contributor": "Owen Williams",
  "title": "Divorcee destroys ex's $1m violin collection in Japan",
  "description": "Divorces often break a heart or two - but in this case, an extra 54 violins were left in tatters.",
  "url": "http://www.bbc.co.uk/news/world-asia-40724397",
  "publishedAt": "2017-07-26T08:22:25Z",
  "category": "Weird"
  }
]
