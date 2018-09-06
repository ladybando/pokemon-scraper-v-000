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
   # pokemon = db.execute("SELECT * FROM Pokemon WHERE id = ?", [id]).first
   #   pk = self.new(id: pokemon[0], name: pokemon[1], type: pokemon[2], db: db)
     statement = db.prepare("SELECT * FROM pokemon WHERE id = ?")
    result_set = statement.execute(id)

    results = result_set.collect do |pokemon|
      pk = Pokemon.new(name: pokemon[1], type:pokemon[2], db: db, id: pokemon[0])
      pk = pokemon[3]
      pk
    end
    results[0]
  end  
  
  def alter_hp(new_hp = 60, db)
    db.execute("UPDATE pokemon SET hp = ? WHERE id = ?", new_hp, self.id)
  end
end

