require 'pry'
class Pokemon
  attr_accessor :name, :type, :db, :id, :hp
  def initialize(id:, name:, type:, db:, hp: nil)
    @id = id
    @name = name
    @type = type
    @db = db
    @hp = hp
  end

  def self.save(name, type, database)
    insert = database.prepare("INSERT INTO pokemon (name, type) VALUES (?,?)")
    insert.execute(name, type)
  end

  def self.find(id, database)
    result = database.execute("SELECT * FROM pokemon WHERE id = #{id}")
    id = result[0][0]
    name = result[0][1]
    type = result[0][2]
    hp = result[0][3]
    new_poke = Pokemon.new(id: id, name: name, type: type, db: database, hp: hp)
    new_poke
  end

  def alter_hp(hp, database)
    update = database.prepare("UPDATE pokemon SET hp = ? WHERE id = ?")
    update.execute(hp, @id)
  end
end
