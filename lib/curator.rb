require './lib/museum'
require './lib/artist'
require './lib/photograph'

class Curator
  attr_reader :museums,
    :artists,
    :photographs

  def initialize
    @museums     = []
    @artists     = []
    @photographs = []
  end

  def add_museum(arguments)
    arguments = {id: museums.count + 1}.merge(arguments)
    @museums << Museum.new(arguments)
  end

  def add_artist(arguments)
    arguments = {id: artists.count + 1}.merge(arguments)
    @artists << Artist.new(arguments)
  end

  def add_photograph(arguments)
    arguments = {id: photographs.count + 1}.merge(arguments)
    @photographs << Photograph.new(arguments)
  end

  def find_museum(id)
    @museums.find do |museum|
      museum.id == id
    end
  end

  def find_artist(id)
    @artists.find do |artist|
      artist.id == id
    end
  end

  def find_artist_by_photograph(photograph)
    id = photograph.artist_id
    find_artist(id)
  end

  def find_museum_by_photograph(photograph)
    id = photograph.museum_id
    find_museum(id)
  end
end
