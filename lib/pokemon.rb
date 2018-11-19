require 'pry'

class Pokemon
  @@all = []

  attr_accessor :id, :name, :type, :db, :hp

  def initialize(id:, name:, type:, db:)
    @id = id
    @name = name
    @type = type
    @db = db
    @hp = hp
    @@all << self
  end

  def self.all
    @@all
  end

  def self.save(name, type, db)
    db.execute("INSERT INTO pokemon (name, type) VALUES (?, ?)", name, type)
  end

  def self.find(id, db)
    pokemon = db.execute('SELECT * FROM pokemon WHERE id = ?', id)
    Pokemon.new(id: pokemon[0][0], name: pokemon[0][1], type: pokemon[0][2], db: db)
  end

  def alter_hp(hp, db)
    @hp = hp
    db.execute('UPDATE pokemon SET hp = ? WHERE ID = ?', hp, id)
  end

end

binding.pry
