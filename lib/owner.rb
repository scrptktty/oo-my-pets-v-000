require "pry"

class Owner
  attr_accessor :owner, :pets, :name
  attr_reader :species

  @@all = []

  def self.all
    @@all
  end

  def self.count
    all.length
  end

  def self.reset_all
    all.clear
  end

  def initialize(species)
    @@all << self

    @species = species
    @name = name
    @owner = owner
    @pets = {:fishes => [], :dogs => [], :cats => []}
  end

  def say_species
    "I am a #{@species}."
  end


  def buy_fish(name)
    pets[:fishes] << Fish.new(name)

    # =(pets[:fishes], fishy)
    # <<(pets[:fishes], fishy)

    # hash[:fishes] = fishy
    # index_into_hash_and_set(fishy)
  end

  def buy_dog(name)
    pets[:dogs] << Dog.new(name)
  end

  def buy_cat(name)
    pets[:cats] << Cat.new(name)
  end

  def walk_dogs
    # pets[:dogs].each { |doggo| doggo.mood = "happy" }
    update_pet_moods(:dogs, "happy")
  end

  def play_with_cats
    update_pet_moods(:cats, "happy")
  end

  def feed_fish
    update_pet_moods(:fishes, "happy")
  end

  def sell_pets
    # update_pet_moods(:dogs, "nervous")
    # update_pet_moods(:cats, "nervous")
    # update_pet_moods(:fishes, "nervous")
    # pets[:dogs] = []
    # pets[:cats] = []
    # pets[:fishes] = []

    pets.each do |pet_type, array|
      update_pet_moods(pet_type, "nervous")
      array.clear
    end

  end

  def list_pets
    "I have #{pets[:fishes].length} fish, #{pets[:dogs].length} dog(s), and #{pets[:cats].length} cat(s)."
  end

  private

  def update_pet_moods(pet_sym, mood)
    pets[pet_sym].each { |animal| animal.mood = mood }
  end

end
