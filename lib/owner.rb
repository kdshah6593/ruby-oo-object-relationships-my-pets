class Owner
  
  attr_reader :name, :species

  @@all = []

  def initialize(name)
    @name = name
    @species = "human"
    @@all << self
  end

  def say_species
    "I am a #{@species}."
  end

  def self.all
    @@all
  end

  def self.count
    @@all.count
  end

  def self.reset_all
    @@all.clear
  end

  def cats #returns a collection of all cats that belong to owner
    Cat.all.select {|cat| cat.owner == self}
  end

  def dogs #returns a collection of all dogs that belong to owner
    Dog.all.select {|dog| dog.owner == self}
  end

  def buy_cat(name) #buy a cat that is instance of Cat class
    Cat.new(name, self)
  end

  def buy_dog(name) #buy a dog that is instance of Dog class
    Dog.new(name, self)
  end

  def walk_dogs #changes all dogs mood to happy
    dogs.each {|dog| dog.mood = "happy"}
  end

  def feed_cats #changes all cats moods to happy
    cats.each {|cat| cat.mood = "happy"}
  end

  def sell_pets #remove pets from owner; pets mood changes to 'nervous'; pet's owner changes to nil
    cats.each {|cat| cat.owner = nil; cat.mood = "nervous"}
    dogs.each {|dog| dog.owner = nil; dog.mood = "nervous"}
  end

  def list_pets #list all the owner's pets
    "I have #{dogs.count} dog(s), and #{cats.count} cat(s)."
  end
end 