class Artist
  attr_accessor :name
  attr_reader :songs

  @@all = []

  def initialize(name)
    @name = name
    @songs = []
  end

  def self.all
    @@all
  end

  def add_song(song)
    @songs << song
    song
  end

  def save
    @@all << self
    self
  end

  def self.find_or_create_by_name(name)
    if @@all.find { |element| element.name == name }
      variable = @@all.find { |element| element.name == name }
    else
      Artist.new(name).save
    end
  end

  def print_songs
    songs.each do |song|
      puts song.name
    end
  end

end
