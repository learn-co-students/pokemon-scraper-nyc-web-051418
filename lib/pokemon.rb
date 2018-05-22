require 'pry'

class Pokemon

  attr_accessor :name, :type, :db, :hp
  attr_reader :id

  def initialize(pokemon, hp=nil)
    @name = pokemon[:name]
    @type = pokemon[:type]
    @id = pokemon[:id]
    @hp = hp
    @db = db
  end

  def self.save(name, type, db)
    sql = <<-SQL
      INSERT INTO pokemon (name, type)
      VALUES (?, ?)
      SQL

      db.execute(sql, name, type)
      @id = db.execute("SELECT last_insert_rowid() FROM pokemon")[0][0]

  end

  def self.find(id, db)
    sql=<<-SQL
    SELECT *
    FROM pokemon
    WHERE id = ?
    SQL

    x = db.execute(sql, id)[0]

    pokemon = {}

    pokemon[:id] = x[0]
    pokemon[:name] = x[1]
    pokemon[:type] =x[2]
    pokemon[:hp] =x[3]
    # binding.pry

    new(pokemon)
  end

end
