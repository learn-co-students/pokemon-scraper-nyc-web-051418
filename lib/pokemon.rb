class Pokemon
  attr_accessor :id, :name, :type, :db

  def initialize(id: nil, name:, type:, db: @db)
    @id = id
    @name = name
    @type = type
  end

  def self.save(name, type, db)
    sql = <<-SQL
      INSERT INTO pokemon (name, type)
      VALUES (?, ?);
    SQL

    db.execute(sql, name, type)
  end

  def self.find(id, db)
    sql = <<-SQL
      SELECT * FROM pokemon
      WHERE id = ?;
    SQL

    db.execute(sql, id).map do |pokemon|
      id = pokemon[0]
      name = pokemon[1]
      type = pokemon[2]
      return Pokemon.new(id: id, name: name, type: type)
    end
  end

end
