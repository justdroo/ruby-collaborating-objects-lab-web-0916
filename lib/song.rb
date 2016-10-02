class Song
 #let(:file_name) {'Michael Jackson - Black or White - pop.mp3'}
  attr_accessor :name, :artist

  def initialize(name)
    @name = name
  end

  def artist_name
    if artist
      artist.name
    else
      nil
    end
  end

  def self.new_by_filename(file_name)
    file_split = file_name.split(' - ')
    song_name = file_split[1]
    song = Song.new(song_name)
    artist = Artist.find_or_create_by_name(file_split[0])
    song.artist = artist
    song
  end

end
