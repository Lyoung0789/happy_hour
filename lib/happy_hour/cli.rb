class HappyHour::CLI 
  
  def call
    # zip_code
    list_names
    information
    the_end
  end 
  
  
  def zip_code
     puts "Hi! Enter your zip code to find restarunts offering Happy Hour near you:"
    input = gets.strip
  end 
  
  #list_names will need to tak in argument from zipcode
  def list_names 
    @locations = HappyHour::Restaurants.local
    @locations.each_with_index {|r, i| puts "#{i+1}. #{r.name}"}
    
  end 
  
  #@locations = HappyHour::Restaurants.local to hold all the information of local restarunts
  
  
  def information 
    input = " "
    while input != "exit"
    puts "Enter the number of the restaruant which you would like to view more details or type list to view list again or type exit to go back to menu" 
      input = gets.strip.downcase
      if input.to_i > 0 
        location = @locations[input.to_i-1]
        puts "#{location.name}\n#{location.location}\n#{location.number}\n#{location.url}"
        puts "Specials: #{location.deals}\nHH times: #{location.hours}"
      elsif input == "list"
        list_names
      elsif input.to_i > @locations.size
        puts "Please enter a valid option"
      else 
        puts "Sorry, your request wasnt submitted. Please enter an option for more information on the location, 'list' to view the locations, or 'exit' to exit the program."
      end 
      # case input 
      #   when "1"
      #     puts "youve accessed more in on Applebees type exit to end program"
      #   when "2"
      #     puts "youve accessed more info on Domutype exit to end program"
      #   when "3"
      #     puts "youve accessed more info on Tori Tori type exit to end program"
      #   when "list"
      #     list_names
      #   else 
      #     puts "Please enter valid selection"
      # end 
    end 
  end 
  
  
  def the_end
    puts 'Thank you for using Happy_Hour'
  end 
  
  
end 