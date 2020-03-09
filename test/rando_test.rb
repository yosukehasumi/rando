require 'minitest/autorun'
require 'rando'

class RandoTest < Minitest::Test

  RUN_COUNT = 5000.freeze
  NAME_REGEX = /^[A-Za-z'.\-]+$/
  PROVINCES = ["Alberta", "British Columbia", "Manitoba", "New Brunswick", "Newfoundland", "Northwest Territories", "Nova Scotia", "Ontario", "Prince Edward Island", "Quebec", "Saskatchewan", "Yukon"]
 
  def test_email_from_name
    assert_equal 'calvin@example.com', Rando.email_from_name('calvin')
    assert_equal 'calvin@example.com', Rando.email_from_name('~!@#$%^&*()+CalVin')
    assert_equal 'calvin@example.com', Rando.email_from_name('  CalVin  ')

    assert_equal 'calvin@hobbes.com', Rando.email_from_name('calvin', 'hobbes.com')
    assert_equal 'calvin@hobbes.com', Rando.email_from_name('calvin', '~!@#$%^&*()_+hobbes.com')
  end

  def test_firstname 
    RUN_COUNT.times do
      assert_match NAME_REGEX, Rando.firstname
    end
  end

  def test_lastname 
    RUN_COUNT.times do
      assert_match NAME_REGEX, Rando.lastname
    end
  end

  def test_name 
    RUN_COUNT.times do
      Rando.name.split.each do |string|
        assert_match NAME_REGEX, string
      end
    end
  end

  def test_phone_number 
    RUN_COUNT.times do
      assert_match /^[0-9][0-9][0-9]\-[0-9][0-9][0-9]\-[0-9][0-9][0-9][0-9]+$/, Rando.phone_number
    end
  end

  def test_postal_code 
    RUN_COUNT.times do
      assert_match /^[A-Z][0-9][A-Z]\ [0-9][A-Z][0-9]+$/, Rando.postal_code
    end
  end

  def test_street_address 
    RUN_COUNT.times do
      assert_match /^[0-9]+\ [A-Za-z0-9 ]+$/, Rando.street_address 
    end
  end

  def test_address 
    RUN_COUNT.times do
      address = Rando.address.split(', ')
      assert_match /^[0-9]+\ [A-Za-z0-9 ]+$/, address[0]
      assert_match /^[A-Za-z'.\s\-]+$/, address[1]
      assert_includes PROVINCES, address[2]
      assert_match /^[A-Z][0-9][A-Z]\ [0-9][A-Z][0-9]+$/, address[3]
    end
  end

  def test_lorem_words
    RUN_COUNT.times do
      assert_match /^[\w.();\-]+$/, Rando.lorem_words(1)
    end
  end
end