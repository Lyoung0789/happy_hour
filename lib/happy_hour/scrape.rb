class HappyHour::Scrape

def self.scrape_site(zipcode)
    doc = Nokogiri::HTML(open("https://www.happy-hour.com/search/?n=&s=#{zipcode}&type=&submit=Search&miles=15&cuisine=&freefood=&ams_opt=any"))
    first_layer = doc.css("div.contentLShadowInner div.contentLInnerContainer")
    # binding.pry
    first_layer.each do |r|
        restaurant = HappyHour::Restaurants.new
        if r.css("a.bodyRedA").text != "" 
          restaurant.name = r.css("a.bodyRedA").text
          restaurant.location = r.css("span.bodySm").text
          restaurant.url = r.css("a.bodyRedA").attribute("href").value
          restaurant.deals = self.scrape_deals(restaurant.url)
          restaurant.number = scrape_number(restaurant.url)
          restaurant.hours = scrape_hours(restaurant.url)

        end 
      end 
      HappyHour::Restaurants.all.pop
      HappyHour::Restaurants.all.shift
      
    #   binding.pry 

end 

def self.scrape_deals(url)
    doc = Nokogiri::HTML(open(url))
    description = "Please contact location for Happy Hour updates"
    things = doc.css("div.contentLInnerContainerPadBot") 
    #goes through the array of information, if it includes any of the following then we can set :deals equal to that
    #if no deals, contact store
    things.css(" td span").each do |r|
      if r.text.include?("$") || r.text.include?("Half") || r.text.include?("1/2")
        if !description.include?(r) 
          description = r.text
        end 
      end 
    end 
    description
end 

def self.scrape_number(url)
    doc = Nokogiri::HTML(open(url))
    first_layer = doc.css("div.contentMajCitShadowInner div.contentMajCitInnerContainer span.bodySm").text
    array = first_layer.split(/[[:space:]]/)
    array[1]
end 

def self.scrape_hours(url)
    hours = "Please contact store for hours"
    doc = Nokogiri::HTML(open(url))
    first_layer = doc.css("div.contentLInnerContainerPadBot")
    first_layer.css("td span").each_with_index do |r, i|
        if r.text.include?("Happy Hour")
          hours = first_layer.css("td span")[i+1].text
        end 
      end 
      hours
end 

end 