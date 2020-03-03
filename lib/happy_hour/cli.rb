class HappyHour::CLI 
  
  def call
    list_names
    information
    the_end
  end 
  
  def list_names 
    puts "Hi! Enter your zip code to find restarunts offering Happy Hour near you:"
    input = gets.strip
    puts "1. Applebees"
    puts "2. Domu"
    puts "3. Tori Tori"
    
  end 
  
  def information 
    input = " "
    puts "Enter the number of the restaruant which you would like to view more details or type exit to go back to menu" 
    while input != "exit"
      input = gets.strip.downcase
      case input 
        when "1"
          puts "youve accessed more in on Applebees type exit to end program"
        when "2"
          puts "youve accessed more info on Domutype exit to end program"
        when "3"
          puts "youve accessed more info on Tori Tori type exit to end program"
      end 
    end 
  end 
  
  
  def the_end
    puts 'Thank you for using Happy_Hour'
  end 
  
  
end 