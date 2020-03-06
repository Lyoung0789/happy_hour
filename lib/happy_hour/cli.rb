class HappyHour::CLI 
  
  def call

    zip_code
    list_names
    information
    the_end
  end 
  
  
  def zip_code
     puts "Hi! Enter your zip code to find restarunts offering Happy Hour near you:"
    input = gets.strip
    @locations = HappyHour::Restaurants.scrape_site(input)
  end 
  
  #list_names will need to tak in argument from zipcode
  def list_names 
    # @locations = HappyHour::Restaurants.scrape_site
    # binding.pry
    @locations.each_with_index {|r, i| puts "#{i+1}. #{r[:name]}"}
    
  end 
  
  #@locations = HappyHour::Restaurants.local to hold all the information of local restarunts
  
  
  def information 
    input = " "
    while input != "exit"
    puts "Enter the number of the restaruant which you would like to view more details or type list to view list again or type exit to go back to menu" 
      input = gets.strip.downcase
      # binding.pry
      if input.to_i > 0 && input.to_i <= @locations.size
        location = @locations[input.to_i-1]
        
        puts "#{location[:name]}\n#{location[:location]}\n#{location[:deals]}\n#{location[:url]}"
        
      elsif input == "list"
        list_names
      elsif input.to_i > @locations.size
        puts "Please enter a valid option"
      else 
        puts "Sorry, your request wasnt submitted. Please enter an option for more information on the location, 'list' to view the locations, or 'exit' to exit the program."
      end 
    end 
  end 
  
  
  def the_end
    puts 'Thank you for using Happy_Hour'
  end 
  

 
  
end 