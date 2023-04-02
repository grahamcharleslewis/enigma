# frozen_string_literal: true

require "enigma/reflector"
require "enigma/rotor"

class Machine
  def initialize
    @reflector = nil
    @rotors = []
  end

  def configure(rotors, reflector)
    @reflector = Reflector.new(reflector)
    rotors.each { |rotor_id| @rotors << Rotor.new(rotor_id) }
  end

  def transcode_character(letter)
    @rotors.each { |rotor| letter = rotor.value_from_key(letter.upcase) }
    letter = @reflector.value_from_key(letter)
    @rotors.reverse.each { |rotor| letter = rotor.key_from_value(letter) }
    letter
  end

  def transcode_string(str)
    plain_text = str.gsub(/[^A-Za-z]*/, "")
    cypher_text = []
    plain_text.chars.each { |char| cypher_text << transcode_character(char) }
    cypher_text.join
  end
end
