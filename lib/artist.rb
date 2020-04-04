class Artist
  attr_accessor :name
  
  def initialize(name)
    @name = name
  end
  
  def songs
    Song.all.select {|song| song.artist == self}
  end
  
  def add_song(song)
    song.artist = self
  end
  
  def add_song_by_name(name)
    song = Song.new(name)
    song.artist = self
  end
  
  def self.song_count
    count = 0
    Song.all.collect |song| { song.artist ? count += 1 }
    count
  end
end