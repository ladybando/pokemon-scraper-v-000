require 'pry'

class Pokemon
  
  attr_accessor :name, :type, :db, :id
  
  def initialize(id)
    @id = id
    @name = name
    @type = type
    @db = db
<<<<<<< HEAD
   end
  
  def self.save(name, type, db)
     db.execute("INSERT INTO pokemon (name, type) VALUES (?, ?)", name, type)
  end
  
  def self.find(id, db)
    binding.pry 
    pokemon = db.execute("SELECT * FROM Pokemon WHERE id = ?", [id]).first
      self.new(id: pokemon[0], name: pokemon[1], type: pokemon[2], db: db)
      
  end
  
  def alter_hp(new_hp = 60, db)
    db.execute("UPDATE pokemon SET hp = ? WHERE id = ?", new_hp, self.id)
=======
    @@all << self
  end
  
  def self.all
    @@all
  end

  def self.save(name, type, db)
     db.execute("INSERT INTO pokemon (name, type) VALUES (?, ?)", name, type)
  end
  
  def self.find(id, db)
   
    pokemon = db.execute("SELECT * FROM Pokemon WHERE id = ?", [id]).first
    Pokemon.new(pokemon[0], name: pokemon[1], type: pokemon[2], db: db)
>>>>>>> fa6a272aabba596553ce0b98e2d73468d9036b1f
  end
end

