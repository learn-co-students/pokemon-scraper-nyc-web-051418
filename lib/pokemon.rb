# saving, adding, removing, or changing anything about each Pokémon
require 'pry'
class Pokemon
  attr_accessor :id, :name, :type, :db
  @@all = []

  def initialize(hash)
    #binding.pry
    @id = hash[:id]
    @name = hash[:name]
    @type = hash[:type]
    @db = hash[:db]
    @@all << self
  end
  def self.all?
    @@all
  end
  def self.save(name, type, db)
    db.execute("INSERT INTO pokemon (name, type) VALUES (?, ?)", name, type)
  end

  def self.find(id, db)
    db.results_as_hash = true
    var = db.execute("SELECT * FROM pokemon WHERE pokemon.id = ?", id)[0]
    new_hash = {:id => var["id"], :name => var["name"],:type => var["type"]}
    Pokemon.new(new_hash)
  end
end
