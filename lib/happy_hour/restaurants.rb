# this is going to return the information of the restarunts

class HappyHour::Restaurants
  @@all = []
  attr_accessor :name, :hours, :deals, :location, :url, :number
  
  def initialize 
   @@all << self 
  end 

  def self.all 
    @@all
  end 

  def self.reset_all 
    @@all.clear 
  end 
  
end 

