require 'pry'
class Pokemon
  @pokemon
  attr_accessor :id, :name, :type, :hp, :db

  def initialize(pokemon)
    @pokemon = pokemon
    @id = pokemon[:id]
    @name = pokemon[:name]
    @type = pokemon[:type]
    @hp = nil
    @db = pokemon[:db]
  end

  def self.save(name, type, db)
    db.execute("INSERT INTO pokemon (name, type) VALUES (?, ?)", name, type)
  end

  def self.find(id, db)
    pokemon_info = (db.execute("SELECT * FROM pokemon WHERE pokemon.id = ?", id))[0]
    poke_obj_hash = {:id => pokemon_info[0], :name => pokemon_info[1], :type => pokemon_info[2], :db => db}
    poke = Pokemon.new(poke_obj_hash)
  end

  def alter_hp(hp_in, db)
  end
end
