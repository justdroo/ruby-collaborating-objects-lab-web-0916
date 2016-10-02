class MP3Importer
 #let(:file_name) {'Michael Jackson - Black or White - pop.mp3'}
  attr_accessor :path, :files

  def initialize(file_path)
    @path = file_path
    @files = []
  end

  def files
    Dir.entries(path).select {|file| file.include?(".mp3")}
  end

  def import
    files.collect do |file|
		    artist_song = file.split(" - ")

		    artist = Artist.find_or_create_by_name(artist_song[0])

        song = artist.add_song_by_name(artist_song[1])

        # song.artist = artist
        # artist.songs << song
	  end
  end

end
