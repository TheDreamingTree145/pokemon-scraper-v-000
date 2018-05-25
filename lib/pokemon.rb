require 'pry'

class Pokemon
  attr_accessor :id, :name, :type, :db, :hp
  @@all = []

  def initialize(id:, name:, type:, hp: nil, db:)
    @id = id
    @name = name
    @type = type
    @db = db
    @hp = hp
  end

  def self.save(name, type, db)
    db.execute("INSERT INTO pokemon (name, type) VALUES (?, ?)",name, type)
  end

  def self.all
    @@all
  end

  def self.find(poke_id, db)
     info = db.execute(("SELECT * FROM pokemon WHERE id = ?"), id).flatten
  # self.save(@pokemon[0][2], @pokemon[0][3], db)
  # binding.pry

    self.save(info[1], info[2], db)
  end

  def alter_hp(damaged_hp, db)
    db.execute(("UPDATE pokemon SET hp = ? WHERE id = ?"), damaged_hp, id)
  end

end
