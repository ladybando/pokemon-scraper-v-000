require 'pry'
class Pokemon
  
  attr_accessor :name, :type, :db, :id, :hp
  
  def initialize(id:, name:, type:, db:)
    @name = name
    @type = type
    @db = db
    @id = id
  end
  
  def self.save(name, type, db)
    db.execute("INSERT INTO pokemon (name, type) VALUES (?,?)",name, type)
  end
  
  def self.find(id, db)
    pokemon= db.execute("SELECT * FROM pokemon WHERE id=?",id).flatten
    Pokemon.new(id: pokemon[0], name: pokemon[1],type: pokemon[2], db: db)
  end
    
    def alter_hp(hp, db)
      db.execute("UPDATE pokemon SET hp = ? WHERE id = ?", hp, self.id)
    end
end
