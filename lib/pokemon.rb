require 'pry'

class Pokemon
  
  attr_accessor :name, :type, :db, :id
  
  def initialize(id)
    @id = id
    @name = name
    @type = type
    @db = db
   end
  
  def self.save(name, type, db)
     db.execute("INSERT INTO pokemon (name, type) VALUES (?, ?)", name, type)
  end
  
  def self.find(id, db)
    
        found_pk = db.execute("SELECT name, type FROM pokemon WHERE id = ?", id)
    return self.new(id: id, db: db, name: found_pk[0][0], type: found_pk[0][1], hp: found_pk[0][2])
    
    pokemon = db.execute("SELECT * FROM Pokemon WHERE id = ?", [id]).first
      self.new(id: pokemon[0][0], name: pokemon[1], type: pokemon[2], db: db)
  #binding.pry  
  end
  
  def alter_hp(hp = 60, db)
    @hp = hp
    db.execute("UPDATE pokemon SET hp = ? WHERE id = ?", hp, self.id)
  end
end

