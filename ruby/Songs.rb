# Classes created during the rails programing book. See notes.md

class Song
  def initialize(name, artist, duration)
    @name     = name
    @artist   = artist
    @duration = duration
  end
end

class Song
  def to_s
    "Song: #{@name}--#{@artist} (#{@duration})"
  end
end

class Song
  attr_reader :name, :artist, :duration
end

class Song
  attr_writer :duration
end

class Song
  def durationInMinutes
    @duration/60.0   # force floating point
  end
  def durationInMinutes=(value)
    @duration = (value*60).to_i
  end
end

#######################

class SongList
  def initialize
    @songs = Array.new
    @index = WordIndex.new
  end
end

class SongList
  def append(aSong)
    @songs.push(aSong)
    @index.index(aSong, aSong.name, aSong.artist)
    self
  end
end

class SongList
  def deleteFirst
    @songs.shift # shifts left retuning the first element
  end
  def deleteLast
    @songs.pop # shifts right returning the last elemtent
  end
end

class SongList
  def [](key)      # method doing SongList['x']
    if key.kind_of?(Integer) then
      @songs[key]
    else
      @songs.find { |aSong| aSong.name == key }
    end
  end
  
  def SongList.readSongs(songFile)
    songs = SongList.new
    songFile.each do |line|
      file, length, name, title = line.chomp.split(/\s*\|\s*/) # chomp removes the end record separator
      name.squeeze!(" ")      # removes contiguous repetions of the same character
      mins, secs = length.scan(/\d+/) # returns the matched patterns in a list, which can be give to a set of identifiers
      songs.append Song.new(title, name, mins.to_i*60+secs.to_i)
    end
    songs
  end
end

class WordIndex
  def initialize
    @index = Hash.new(nil)
  end
  def index(anObject, *phrases)
    phrases.each do |aPhrase|
      aPhrase.scan /\w[-\w']+/ do |aWord|   # extract each word
        aWord.downcase!
        @index[aWord] = [] if @index[aWord].nil?
        @index[aWord].push(anObject)
      end
    end
  end
  def lookup(aWord)
    @index[aWord.downcase]
  end
end

list = SongList.new
list.
  append(Song.new('title1', 'artist1', 1)).
  append(Song.new('title2', 'artist2', 2)).
  append(Song.new('title3', 'artist3', 3)).
  append(Song.new('title4', 'artist4', 4))