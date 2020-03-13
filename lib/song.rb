require 'pry'

class Song
  attr_accessor :name, :artist_name
  @@all = []

  def self.all
    @@all
  end

  def self.create
    song = self.new
    song.save
    song
  end
  
  def self.new_by_name(name)
    song = self.new
    song.name = name
    song
    # song = self.create
    # song.name = name
    # song
  end

  def self.create_by_name(name)
    # name = new_by_name(name)
      song = self.create
      song.name = name
      song
  end
  
  def self.find_by_name(name)
    @@all.find { |song| song if song.name == name }
  end

  def self.find_or_create_by_name(name)
    self.find_by_name(name) != nil ? self.find_by_name(name) : self.create_by_name(name)
  end
  
  def self.alphabetical
    @@all.sort_by do |song|
      song.name
    end
  end
  
  def self.new_from_filename(filename)
    artist_name = filename.split(" - ")[0]
    name = filename.split(" - ")[1][0..-5]
    song = self.new
    song.name = name
    song.artist_name = artist_name
    song
  end
  
  def self.create_from_filename(filename)
    artist_name = filename.split(" - ")[0]
    name = filename.split(" - ")[1][0..-5]
    song = self.create
    song.name = name
    song.artist_name = artist_name
    song
  end
  
  def self.destroy_all
    @@all.clear
  end
  
  def save
    self.class.all << self
  end

end
