
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
    hikes << self.scrape_hike_two 
  end 
  
  def self.scrape_hike_one
   html = (open("https://dayhikesneardenver.com/bear-canyon-loop-hike-ncar/"))
    doc = Nokogiri::HTML(html)
   name = doc.css("h1.post.entry-title a").text 
   city = doc.css("td.snapshotdetail").text.split[27]
   state = doc.css("td.snapshotdetail").text.split[28].scan(/[A-Z][a-z]+/).join(",").split(",")[0]
   location = city + " " + state
   miles = doc.css("td.snapshotdetail").text.split[1]
   distance = "Approx #{miles} Miles"
   hike_one = self.new(name, location, distance)
  end 
  
  def self.scrape_hike_two
    html =  (open("https://dayhikesneardenver.com/elk-meadow-park-south-loop/"))
    doc = Nokogiri::HTML(html)
    name = doc.css("h1.post.entry-title").text 
    city = doc.css("td.snapshotdetail").text.split[14]   
   state = doc.css("td.snapshotdetail").text.split[15].scan(/[A-Z][a-z]+/).join(",").split(",")[0]
   location = city + " " + state
   miles = doc.css("td.snapshotdetail").text.split[0]
   distance = "Approx #{miles} Miles"
   hike_two = self.new(name, location, distance)
   binding.pry 
  end 
  
end 

  







  
