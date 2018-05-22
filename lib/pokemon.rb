require 'pry'

class Pokemon

attr_reader :id, :name, :type, :db
  #@@all = []
  @pokemon

  def initialize (pokemon)
    #binding.pry
    @pokemon = pokemon #creates an instance hash of pokemon
    @id = pokemon[:id] #sets instance hash attibutes to pokemon
    @name = pokemon[:name]#sets instance hash attibutes to pokemon
    @type = pokemon[:type]#sets instance hash attibutes to pokemon
  #  @hp = pokemon[:hp]#sets instance hash attibutes to pokemon
    @db = pokemon[:db]#sets instance hash attibutes to pokemon
  end


    def self.save(name, type, database_connection)
        database_connection.execute("INSERT INTO pokemon (name, type) VALUES (?,?)", name, type)
    end
    def self.find(id, database_connection)
        # this finds id from DB and returns the id
        db_poke_find_id = database_connection.execute("SELECT * FROM pokemon WHERE id =?", id)[0]
        # this hash has been defined by the methods below by returning the values from the find above
        #this saves the return of data into a hash so we can find information, in this case ID
        poke_hash = {:id => db_poke_find_id[0], :name => db_poke_find_id[1], :type => db_poke_find_id[2], :db => database_connection}
        #learn states to return a new instance with the information
        poke = Pokemon.new(poke_hash)
        poke
    end

    # def self.alter_hp
    #   #this updates a row
    #   pu = database_connection.execute("UPDATE pokemon SET hp = 60;")
    #   binding.pry
    # end
end
