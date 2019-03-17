require 'pry'
class DogHikes 
  def self.scrape_info
    hikes = []
    hikes << self.hike_one 
    hikes << self.hike_two 
    
  end 
  
  def self.scrape_hike
   doc = Nokogiri::HTML (open("https://dayhikesneardenver.com/bear-canyon-loop-hike-ncar/"))
    binding.pry 
  end 
  
end 




  
