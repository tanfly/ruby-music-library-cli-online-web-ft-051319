
class Artist
  extend Concerns::Findable


  attr_accessor :name, :genres

  @@all = []

  def initialize(name)
    @name = name

  end

  def self.all
    @@all
  end

  #beyonce.songs
  #beyonce => <Artist3495834509 @name="Beyonce

  def songs
    Songs.all.select {|song| song.artist == self} 

    #=> [<Song90348503945 @artist = <Artist3495834509 @name="Beyonce">>, <Song349583054 @artist=<Artist34958309548 @name="Adele">>, <Song30948503845]
  end

  def self.create(artist)
    @artist = self.new(artist)
    @artist.save
    @artist
  end

  def self.destroy_all
    self.all.clear
  end

   def self.count
    @@all.size
  end

  def save
    @@all << self
  end

  def add_song(song)
    self.songs << song unless songs.include?(song)
    if song.artist.nil?
      song.artist = self
    end
  end

  def genres
    songs.collect {|song| song.genre}.uniq
  end


end
