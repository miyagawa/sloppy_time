require 'test_helper'

class PlaceTest < ActiveSupport::TestCase
  test "the truth" do
    place = Place.new
    assert place.valid?
  end
end
