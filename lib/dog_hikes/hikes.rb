class DogHikes::Hikes 

attr_accessor :name, :location, :distance 
  @@all = []

  def initialize(name, location, distance)
    @name = name
    @location = location 
    @distance = distance 
    @@all << self
  end

  def self.all
    @@all
  end
  
  def save
    @@all << self.scrape_info
  end
  
  def self.scrape_breakfast
    html = open(https://dayhikesneardenver.com/best-dog-hikes-denver/")
    doc = Nokogiri::HTML(html)
end 
end 
hike1 = self.new 
hike1.name = "Bear Canyon Loop Trail" 
hike1.location = "Boulder, Colorado"
hike1.distance = "3.5 miles"

hike2 = self.new 
hike2.name = "Elk Meadow Park" 
hike2.location = "Evergreen, Colorado" 
hike2.distance = "2.6 miles" 

[hike 1, hike2]
  
  
