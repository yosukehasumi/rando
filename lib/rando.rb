require [__dir__, '/rando_data.rb'].join

module Rando
  # ---------------------------------------- email helper
  def self.email_from_name(name, domain = 'example.com')
    name = name.downcase
               .gsub(/\A\s+/, '') # leading whitespace
               .gsub(/\s+\Z/, '') # trailing whitespace
               .gsub(' ', '_')    # swap inside whitespaces with underscores
               .gsub(/[^0-9a-z_]/, '') # strip out non-alphanumeric except our underscores
    "#{name}@#{domain.gsub(/[^0-9a-z.]/, '')}" 
  end

  # ---------------------------------------- names
  def self.firstname
    RandoData::FIRSTNAMES.sample
  end

  def self.lastname
    RandoData::LASTNAMES.sample
  end

  def self.name
    "#{firstname} #{lastname}"
  end

  # ---------------------------------------- phone number
  def self.phone_number
    number = rand(1e9...1e10).to_i.to_s
    number.insert(6, '-')
    number.insert(3, '-')
    number
  end

  # ---------------------------------------- address
  def self.postal_code
    "#{letter}#{number}#{letter} #{number}#{letter}#{number}"
  end

  def self.street_address
    "#{rand(99999)} #{RandoData::STREETNAMES.sample} #{RandoData::STREET_SUFFIXES.sample}"
  end

  def self.address
    province = RandoData::PROVINCES.keys.sample
    city = RandoData::PROVINCES[province].sample
    
    "#{street_address}, #{city}, #{province}, #{postal_code}"
  end

  # ---------------------------------------- lorem ipsum

  def self.lorem_sentences(count = 2)
    lorem_words(count * 30)
  end

  def self.lorem_words(count)
    # Merge paragraphs into one line and split into words
    words = RandoData::LOREM

    # Start at a random index in the array
    start_inx = rand(words.count - count)

    # Check for overrun
    raise "I don't know that many words. Try a smaller value." if (start_inx + count) > words.count

    # Select a random subset of words
    select_words = words[start_inx, count]

    # Capitalize the first word in the sentence
    select_words[0].to_s.capitalize!

    # Merge words into a string
    return_words = select_words.join(' ')

    # Correct the sentence's punctuation
    RandoData::PUNCTUATION.each do |punct|
      if return_words[return_words.length - 1].to_s == punct
        return_words[return_words.length - 1] = "."
        next
      end
    end
    return_words << "."

    return_words
  end

  private

  def self.letter
    Array('A'..'Z').sample
  end

  def self.number
    rand(0-9)
  end
  end