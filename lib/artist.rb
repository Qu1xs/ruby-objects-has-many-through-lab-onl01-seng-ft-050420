require 'pry'

class Artist
  attr_accessor :name
  @@all = []

  def initialize(name)
    @name = name
    @@all << self
  end
  
  def self.all
    @@all
  end
  
  def new_song(name, genre)
    Song.new(name, self, genre)
  end
  
  def songs
    Song.all.select {|song| song.artist == self}
  end
  
  #How one class talks to another
  def genres
    songs.map {|song| song.genre}
  end 
  
end


class Customer
  attr_accessor :name, :age
 
  @@all = []
 
  def initialize(name, age)
    @name = name
    @age = age
    @@all << self
  end
 
  def self.all
    @@all
  end
 
  def meals
    Meal.all.select do |meal|
      meal.customer == self
    end
  end
 
  def waiters
    meals.map do |meal|
      meal.waiter
    end
  end
 
  def new_meal(waiter, total, tip=0)
    Meal.new(waiter, self, total, tip)
  end

end