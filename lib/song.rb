class Song
  attr_accessor :name, :artist_name
  @@all = []

  def self.all
    @@all
  end

  def save
    self.class.all << self
  end

  # def initialize(name)
  #   @name = name 
  #   @song = song 
  #   @all << self
  # end 

  def self.create
    song = self.new 
    song.save 
    song
  end 

  def self.new_by_name(song_name)
    song = self.new 
    song.name = song_name 
    song.save 
    song 
  end 

  def self.create_by_name(create_song_by_name)
    song = self.new
    song.name = create_song_by_name
    song.save 
    song
  end  
    
  def self.find_by_name(name)
    self.all.find{|song| song.name == name}
  end 

  def self.find_or_create_by_name(find_song)
   if self.find_by_name(find_song) == nil 
      self.create_by_name(find_song)
   else
    self.all.detect {|x| x.name == find_song}
    end 
  end 

  def self.alphabetical 
    self.all.sort_by{|song| song.name}
  end 

  def self.new_from_filename(mp3_formatted_file)
    c = self.new 
    c.name = mp3_formatted_file.split(/[^a-zA-Z\s]|\s-\s/)[1] 
    c.artist_name = mp3_formatted_file.split(/[^a-zA-Z\s]|\s-\s/)[0]
    c 
  end 

  def self.create_from_filename(mp3_formatted_file)
    c = self.new 
    c.name = mp3_formatted_file.split(/[^a-zA-Z\s]|\s-\s/)[1] 
    c.artist_name = mp3_formatted_file.split(/[^a-zA-Z\s]|\s-\s/)[0]
    c.save
    c 
  end 

  def self.destroy_all 
    self.all.clear
  end 
end
