require 'pry'

class Pokemon

    attr_accessor :id, :name, :type, :hp, :db

     #

    def initialize(id:, name:, type:, hp: 60, db:)
      @id = id
      @name = name
      @type = type
      @hp = hp
      @db = db
    end

    def self.save (name, type, db)

      sql = "INSERT INTO pokemon (name, type) VALUES (?, ?)"
      db.execute(sql, name, type)

    end

    def self.find(id, db)

        sql = <<-SQL
          SELECT *
          FROM pokemon
          WHERE id = ?
        SQL

        found_poke = db.execute(sql, id).flatten
        Pokemon.new(id: found_poke[0], name: found_poke[1], type: found_poke[2], hp: found_poke[3], db: db)

    end

    def alter_hp (altered_hp, db)

        sql = "UPDATE pokemon SET altered_hp = ? WHERE id = ?"

        db.execute(sql, altered_hp, self.id)


    end

end
