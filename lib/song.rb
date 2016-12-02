require 'pry'

class Song
  attr_accessor :name, :artist

  @@all = []
  def initialize(name)
    @name = name
  end


  def self.new_by_filename(filename)
    artist_name = filename.split(" - ")[0]
    song_name = filename.split(" - ")[1]
    new_song = self.new(song_name)
    new_song.artist = Artist.find_or_create_by_name(artist_name)
    new_song.artist.add_song(new_song)
    new_song.save
  end

  def self.all
    @@all
  end

  def save
    @@all << self
    self
  end
end
