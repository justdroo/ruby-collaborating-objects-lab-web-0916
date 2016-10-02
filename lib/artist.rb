class Artist

  attr_accessor :name, :songs

  @@song_count = 0
  @@all = []

  def initialize (name)
    @name = name
    @songs = []
    self.save
  end

  def add_song(song)
    song.artist = self
    @@song_count += 1
    @songs << song
  end

  def add_song_by_name(song)
    new_song = Song.new(song)
    new_song.artist = self
    @@song_count += 1
    @songs << new_song

    new_song
  end

  def self.song_count
    @@song_count
  end

  def save
    Artist.all << self
  end

  def self.all
    @@all
  end

  def self.find_or_create_by_name(name_str)
    if (all.detect {|artist_obj| artist_obj.name == name_str} == nil )
      Artist.new(name_str)
    else
      all.detect  {|artist_obj| artist_obj.name == name_str}
    end
  end

def print_songs
  @songs.each_with_object ([]) { |song_obj| puts song_obj.name}
end

end
