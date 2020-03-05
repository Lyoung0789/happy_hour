# this is going to return the information of the restarunts

class HappyHour::Restaurants
  @@all = []
  attr_accessor :name, :hours, :deals, :location, :url, :number
  
  def self.local 
   #must return Scrape then returns delas based on the data
    
    # place_1 = self.new 
    # place_1.name = "Applebees"
    # place_1.hours= "10AM-5PM M-f"
    # place_1.deals = "Free everything"
    # place_1.location = "1234 somewhwere blvd "
    # place_1.url = "https://www.applebees.com/en"
    # place_1.number = 543524262
    
    # place_2 = self.new 
    # place_2.name = "Domu"
    # place_2.hours= "11AM-57PM M-f"
    # place_2.deals = "Free food domu"
    # place_2.location = "7777 OG street "
    # place_2.url = "Domufl.com"
    # place_2.number = 1111111111
    
    # place_3 = self.new 
    # place_3.name = "Tori Tori"
    # place_3.hours= "6PM -8PM saturday and sunday"
    # place_3.deals = "half off select drinks"
    # place_3.location = "7567 a place street "
    # place_3.url = "tori_tori.com"
    # place_3.number = 3333333333
    
    # # binding.pry
    
    # [place_1, place_2, place_3]
    
    self.scrape_site
    
  end 
  
  
  # def self.scrape_locations
    
  #   # go to happy-hour.com enter zip code 
  #   # extract information from site
  #   # instantiate new location 
  #   happy << self.scrape_site
  #   happy
    
  # end 
  
  def self.scrape_site
    title =[]
    doc = Nokogiri::HTML(open("https://www.happy-hour.com/search/?n=&s=32837&type=&submit=Search&miles=15&cuisine=&freefood=&ams_opt=any"))
    first_layer = doc.css("div.contentLShadowInner div.contentLInnerContainer")
    
    first_layer.each do |r|
      info = {}
      if r.css("a.bodyRedA").text != "" 
        info[:name] = r.css("a.bodyRedA").text
        info[:location] = r.css("span.bodySm").text
        info[:url] = r.css("a.bodyRedA").attribute("href").value
        # binding.pry
      end 
      @@all << info
    end 
    
    # binding.pry
    @@all.pop
    @@all.shift
    @@all
    
  end 
  
  
end 

