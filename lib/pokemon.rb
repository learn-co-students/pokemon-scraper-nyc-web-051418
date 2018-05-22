require 'pry'
class Pokemon


    attr_accessor :name, :type, :db, :id

    def initialize(id:, name:, type:, hp: nil, db:)
        @id = id
        @name = name
        @type = type
        # @hp = nil
        @db = db
    end

    def self.save(name, type, db)
      db.execute(
      "INSERT INTO Pokemon (name,type)
      VALUES(?,?)", name, type)
    end

    def self.find(id, db)
      result = db.execute("SELECT * FROM Pokemon WHERE id = ?",id).flatten
      newobject = Pokemon.new(id: result[0],name:result[1],type:result[2],db:db)
      #
    end
  end
