class HappyHour::Restaurants
  attr_accessor :name, :hours, :deals, :location, :url
  
  def self.local 
    # puts "1. Applebees"
    # puts "2. Domu"
    # puts "3. Tori Tori"
    
    place_1 = self.new 
    place_1.name = "Applebees"
    place_1.hours= "10AM-5PM M-f"
    place_1.deals = "Free everything"
    place_1.location = "1234 somewhwere blvd "
    place_1.url = "https://www.applebees.com/en"
    
    place_2 = self.new 
    place_2.name = "Domu"
    place_2.hours= "11AM-57PM M-f"
    place_2.deals = "Free food domu"
    place_2.location = "7777 OG street "
    place_2.url = "Domufl.com"
    
    place_3 = self.new 
    place_3.name = "Tori Tori"
    place_3.hours= "6PM -8PM saturday and sunday"
    place_3.deals = "half off select drinks"
    place_3.location = "7567 a place street "
    place_3.url = "tori_tori.com"
    
    puts [place_1, place_2, place_3]
    
  end 
  
end 