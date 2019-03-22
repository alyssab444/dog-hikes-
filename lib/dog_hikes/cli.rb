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
    @hikes = DogFriendlyHikes::Hikes 
    @hikes.scrape_hikes.each_with_index do |hike, i=1|
      puts "#{i+1}. #{hike.name}"
    end 
  end 
  
  def menu
    puts "Choose the hike you would like to learn more about or type exit"
    input = nil
    while input != "exit"
    input = gets.strip.downcase
       if input.to_i > 0
         the_hike = @hikes.scrape_hikes[input.to_i-1]
            puts "#{the_hike.name} - #{the_hike.location} - #{the_hike.distance}"
        elsif input == "list" 
            list_hikes 
        else 
           puts "Invalid entry, type list to see the hikes or exit."
     end 
    end 
  end 
    
  def goodbye 
    puts "See you later for your next hike!"
  end 
end 