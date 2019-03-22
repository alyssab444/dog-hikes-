#CLI controller

class DogFriendlyHikes::CLI
 
 def call 
    puts "Looking to take your pup on an adventure?"
    DogFriendlyHikes::Hikes.scrape_hikes
    list_hikes
    menu
    goodbye 
 end  
  
  def list_hikes
    puts "Dog Friendly Hikes:"
    DogFriendlyHikes::Hikes.scrape_hikes.each_with_index do |hike, i=1|
      puts "#{i+1}. #{hike.name}"
    #DogFriendlyHikes::Hikes.scrape_hikes.each_with_index do |hike, i=1|
      #puts "#{i}. #{hike.name}- #{hike.location} - #{hike.distance}"
    end 
  end 
  
  def menu
    input = nil 
    while input != "exit"
    puts "Choose the hike you would like to learn more about or type exit"
       if input.to_i > 1
      input = gets.strip.downcase  
      
      #if input.to_i > 1 
        the_hike = DogFriendlyHikes::Hikes[input.to_i-1]
        puts "#{the_hike.name} - #{the_hike.location} - #{the_hike.distance}"
      elsif input == "list"
       list_hikes 
       # else 
          #puts "Invalid entry, type list or exit."
      end 
    end 
  end 
    
  def goodbye 
    puts "See you later for your next hike!"
  end 
end 