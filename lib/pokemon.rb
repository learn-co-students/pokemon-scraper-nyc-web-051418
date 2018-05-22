require 'pry'

class Pokemon

attr_reader :id, :name, :type, :db
  #@@all = []
  @pokemon

  def initialize (pokemon)
    #binding.pry
    @pokemon = pokemon
    @id = pokemon[:id]
    @name = pokemon[:name]
    @type = pokemon[:type]
    @db = pokemon[:db]
  end

    # def self.all
    #   @@all
    # end

    def self.save(name, type, database_connection)
        database_connection.execute("INSERT INTO pokemon (name, type) VALUES (?,?)", name, type)
    end
    def self.find(id, database_connection)

        db_poke_find_id = database_connection.execute("SELECT * FROM pokemon WHERE id =?", id)[0]
        poke_hash = {:id => db_poke_find_id[0], :name => db_poke_find_id[1], :type => db_poke_find_id[2], :db => database_connection}
        poke = Pokemon.new(poke_hash)
        poke
        #poke_hash = db_poke_find_id
    end
end
