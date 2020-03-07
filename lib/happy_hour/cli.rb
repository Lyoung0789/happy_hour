class HappyHour::CLI 
  def welcome
    puts " ----------------------------------"
    puts "|                                  |"
    puts "|    Welcome to Happy Hour!        |"
    puts "|                                  |"
    puts " ----------------------------------"
    puts ""
    

    call
    the_end 
  end 

  def call
    @exit = 0 
    puts "-------------------------------------------------------------------------"
    puts "Hi! Enter your zip code to find restarunts offering Happy Hour near you:\t"
    zip_code
  if @exit == 0 
    list_names
    information
  end 
    
  end 
  
  
  def zip_code
    input = gets.strip

    if input.downcase=="exit"
      @exit = 1
      return @exit 
    end 
    HappyHour::Scrape.scrape_site(input)
    if HappyHour::Restaurants.all.empty?
      puts "Please enter new zipcode"
      zip_code
    end 
  end 
  
  def list_names 
    puts "\n"
    HappyHour::Restaurants.all.each_with_index {|r, i| puts "#{i+1}. #{r.name}"}
    puts "---------------------------------------------------------------------------"
  end 
  

  def information 
    puts "Enter the number of the restaruant you would like to view more details on,\nEnter 'list' to view list again,\nEnter 'zipcode' to enter a new zipcode,\nEnter 'exit' to leave the program."
    input = gets.strip.downcase
    
    
    while input.downcase != "exit" 
      
      
      if input.to_i > 0 && input.to_i <= HappyHour::Restaurants.all.size
        location = HappyHour::Restaurants.all[input.to_i-1]
        
        puts "\nName: #{location.name}\nAddress: #{location.location}\nPhone: #{location.number}\nHappy Hours: #{location.hours}\nSpecials #{location.deals}\n"
        
        
      elsif input == "list"
        list_names
      elsif input.to_i > HappyHour::Restaurants.all.size
        puts "\nPlease enter a valid option"
      elsif input.downcase == "zipcode"
        HappyHour::Restaurants.reset_all
        call
        break 
      elsif input.downcase == "exit"
        break 
      else 
        puts "Sorry, your request wasnt submitted. Please enter an option\nEnter the number of the restaruant which you would like to view more details,  type 'list' to view list again, type 'zipcode' to enter a new zipcdoe,  type 'exit' to leave the program."
      end 
      puts "\nEnter the number of the restaruant you would like to view more details on,\nEnter 'list' to view list again,\nEnter 'zipcode' to enter a new zipcdoe,\nEnter 'exit' to leave the program."
      input = gets.strip.downcase
    end 



  end 
  
  

  def the_end
    puts "\nThank you for using HH!! "
    puts ".~~~~."
    puts "i====i_"
    puts "|cccc|_)"
    puts "|cccc|"  
    puts "`-==-'"
  end 
  

 
  
end 