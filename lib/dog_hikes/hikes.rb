
class DogFriendlyHikes::Hikes 

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
    @@all << self.scrape_hikes
  end

  def self.scrape_hikes
    hikes = []
    hikes << self.scrape_hike_one 
    hikes << self.scrap_hike_two 
  end 
  
  def self.scrape_hike_one
   html = (open("https://dayhikesneardenver.com/bear-canyon-loop-hike-ncar/"))
    doc = Nokogiri::HTML(html)
   name = doc.css("h1.post.entry-title a").text 
   location = doc.css("td.snapshotdetail").text 
   distance = doc.css("td.snapshotdetail").text
   hike_one = self.new(name, location, distance) 
   binding.pry 
  end 
  
  def self.scrape_hike_two
    html = L (open("https://dayhikesneardenver.com/elk-meadow-park-south-loop/"))
    doc = Nokogiri::HTML(html)
    name = doc.css("h1.post entry-title").text 
    location = doc.css("td.snapshotdetail").text 
    distance = doc.css("td.snapshotdetail").text 
    hike_two = self.new(name, location, distance)
  end 
  
end 

  







  
