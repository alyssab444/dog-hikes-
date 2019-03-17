
class DogHikes 
  def self.scrape_info
    hikes = []
    hikes << self.scrape_hike_one  
    hikes << self.scrape_hike_two  
    
  end 
  
  def self.scrape_hike_one
   doc = Nokogiri::HTML (open("https://dayhikesneardenver.com/bear-canyon-loop-hike-ncar/"))
   name = doc.search("h1.post entry-title").text 
   location = doc.css("td.snapshotdetail").text 
   distance = doc.css("td.snapshotdetail").text 
    binding.pry 
  end 
  
end 






  
