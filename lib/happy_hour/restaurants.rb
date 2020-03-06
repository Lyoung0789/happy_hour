# this is going to return the information of the restarunts

class HappyHour::Restaurants
  @@all = []
  attr_accessor :name, :hours, :deals, :location, :url, :number
  
  def self.local 
   #must return Scrape then returns delas based on the data
    self.scrape_site
    
  end 
  
  
  # def self.scrape_locations
    
  #   # go to happy-hour.com enter zip code 
  #   # extract information from site
  #   # instantiate new location 
  #   happy << self.scrape_site
  #   happy
    
  # end 
  
  def self.scrape_site(zipcode)
    title =[]
    doc = Nokogiri::HTML(open("https://www.happy-hour.com/search/?n=&s=#{zipcode}&type=&submit=Search&miles=15&cuisine=&freefood=&ams_opt=any"))
    first_layer = doc.css("div.contentLShadowInner div.contentLInnerContainer")
    
    first_layer.each do |r|
      info = {}
      if r.css("a.bodyRedA").text != "" 
        info[:name] = r.css("a.bodyRedA").text
        info[:location] = r.css("span.bodySm").text
        info[:url] = r.css("a.bodyRedA").attribute("href").value
        info[:deals] = self.scrape_deals(info[:url])
        
        #create new restaurants here.
        #the scrape should be in a class of its own
        @@all << info
        # binding.pry
      end 
      # binding.pry 
      
    end 
    
    # binding.pry
    @@all.pop
    @@all
    
  end 
  
  def self.scrape_deals(url)
    doc = Nokogiri::HTML(open(url))
    title = "Please contact location for Happy Hour updates"
    things = doc.css("div.contentLInnerContainerPadBot") 
    #goes through the array of information, if it includes any of the following then we can set :deals equal to that
    #if no deals, contact store
    things.xpath("//td//span").each do |r|
      if r.text.include?("$") || r.text.include?("Half") || r.text.include?("1/2")
        if !title.include?(r) 
          title = r.text
        end 
      end 
    end 
    title
  end 

  
end 

