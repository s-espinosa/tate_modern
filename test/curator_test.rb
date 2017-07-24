require 'minitest'
require 'minitest/autorun'
require 'minitest/pride'
require './lib/curator'

class CuratorTest < Minitest::Test
  def test_it_exists
    curator = Curator.new

    assert_instance_of Curator, curator
  end

  def test_it_starts_with_no_museums
    curator = Curator.new

    assert_equal [], curator.museums
  end

  def test_it_starts_with_no_photographs
    curator = Curator.new

    assert_equal [], curator.photographs
  end

  def test_it_starts_with_no_artists
    curator = Curator.new

    assert_equal [], curator.artists
  end

  def test_it_can_create_a_museum
    curator = Curator.new

    curator.add_museum({name: "Tate Modern"})

    assert_equal 1, curator.museums.count
    assert_instance_of Museum, curator.museums.first
    assert_equal "Tate Modern", curator.museums.first.name
    assert_equal 1, curator.museums.first.id
  end

  def test_it_can_create_an_artist
    curator = Curator.new

    curator.add_artist({name: "Ansel Adams", born: 1902, died: 1984, country: "United States"})

    assert_equal 1, curator.artists.count
    assert_instance_of Artist, curator.artists.first
    assert_equal "Ansel Adams", curator.artists.first.name
    assert_equal 1, curator.artists.first.id
  end

  def test_it_can_create_a_photograph
    curator = Curator.new

    curator.add_photograph({name: "Moonrise, Hernandez", artist_id: 1, museum_id: 1, year: 1941})

    assert_equal 1, curator.photographs.count
    assert_instance_of Photograph, curator.photographs.first
    assert_equal "Moonrise, Hernandez", curator.photographs.first.name
    assert_equal 1, curator.photographs.first.id
  end

  def test_it_can_find_a_museum_by_id
    curator = Curator.new
    curator.add_museum({name: "Tate Modern"})

    museum = curator.find_museum(1)

    assert_equal 1, museum.id
    assert_equal "Tate Modern", museum.name
  end

  def test_it_can_find_an_artist_by_id
    curator = Curator.new
    curator.add_artist({name: "Ansel Adams", born: 1902, died: 1984, country: "United States"})

    artist = curator.find_artist(1)

    assert_equal 1, artist.id
    assert_equal "Ansel Adams", artist.name
  end

  def test_it_can_find_a_museum_that_holds_a_photograph
    curator = Curator.new
    curator.add_artist({name: "Ansel Adams", born: 1902, died: 1984, country: "United States"})
    curator.add_museum({name: "Tate Modern"})
    curator.add_photograph({name: "Moonrise, Hernandez", artist_id: 1, museum_id: 1, year: 1941})
    photograph = curator.photographs.first

    museum = curator.find_museum_by_photograph(photograph)

    assert_equal "Tate Modern", museum.name
  end

  def test_it_can_find_an_artist_that_took_a_photograph
    curator = Curator.new
    curator.add_artist({name: "Ansel Adams", born: 1902, died: 1984, country: "United States"})
    curator.add_museum({name: "Tate Modern"})
    curator.add_photograph({name: "Moonrise, Hernandez", artist_id: 1, museum_id: 1, year: 1941})
    photograph = curator.photographs.first

    artist = curator.find_artist_by_photograph(photograph)

    assert_equal "Ansel Adams", artist.name
  end
end
