
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
    @@all << self.scrape_hikes
  end

  def self.scrape_hikes
    hikes = []
    hikes << self.scrape_hike_one 
    hikes << self.scrap_hike_two 
  end 
  
  def self.scrape_hike_one
   doc = Nokogiri::HTML (open("https://dayhikesneardenver.com/bear-canyon-loop-hike-ncar/"))
   name = doc.css("h1.post entry-title").text 
   location = doc.css("td.snapshotdetail").text 
   distance = doc.css("td.snapshotdetail").text
   hike_one = self.new(name, location, distance)    
  end 
  
  def self.scrape_hike_two
    doc = Nokogiri::HTML (open("https://dayhikesneardenver.com/elk-meadow-park-south-loop/"))
    name = doc.css("h1.post entry-title").text 
    location = doc.css("td.snapshotdetail").text 
    distance = doc.css("td.snapshotdetail").text 
    hike_two = self.new(name, location, distance)
  end 
  
end 

  







  
