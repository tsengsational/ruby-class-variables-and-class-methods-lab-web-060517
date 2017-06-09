require 'pry'

class Song

  attr_accessor :name, :artist, :genre

  @@count = 0
  @@genres = []
  @@artists = []

  def initialize(name, artist, genre)
    @@count += 1
    @@genres << genre
    @@artists << artist
    self.name = name
    self.artist = artist
    self.genre = genre
  end

  def self.count
    @@count
  end

  def self.genres
    @@genres.uniq
  end

  def self.artists
    @@artists.uniq
  end

  def self.genre_count
    #takes array w/ duplicate values and returns a hash
    #with keys which are the unique genres, which point
    #to a value which is the number of times the genre
    #appears in the array

    uniq_genres = self.genres
    genre_hash = uniq_genres.each_with_object({}) do |genre, hash|
      # binding.pry
      hash[genre] = @@genres.count(genre)
    end
  end

  def self.artist_count
    uniq_artists = self.artists
    artist_hash = uniq_artists.each_with_object({}) do |artist, hash|
      hash[artist] = @@artists.count(artist)
    end
  end


end
