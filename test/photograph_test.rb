require 'minitest'
require 'minitest/autorun'
require 'minitest/pride'
require './lib/photograph'

class PhotographTest < Minitest::Test
  def test_it_exists
    photograph = Photograph.new({id: 1, name: "Rue Mouffetard, Paris (Boy with Bottles)", artist_id: 1, museum_id: 1, year: 1954})

    assert_instance_of Photograph, photograph
  end

  def test_it_has_a_name
    photograph = Photograph.new({id: 2, name: "Moonrise, Hernandez", artist_id: 2, museum_id: 1, year: 1941})

    assert_equal "Moonrise, Hernandez", photograph.name
  end

  def test_it_has_an_artist_id
    photograph = Photograph.new({id: 3, name: "Identical Twins, Roselle, New Jersey", artist_id: 3, museum_id: 1, year: 1967})

    assert_equal 3, photograph.artist_id
  end

  def test_it_has_a_museum_id
    photograph = Photograph.new({id: 4, name: "Allie Mae Burroughs", artist_id: 4, museum_id: 1, year: 1936})

    assert_equal 1, photograph.museum_id
  end

  def test_it_has_a_year
    photograph = Photograph.new({id: 5, name: "Obrero en huelga asesinado", artist_id: 5, museum_id: 1, year: 1934})

    assert_equal 1934, photograph.year
  end
end
