# frozen_string_literal: true

require "enigma/reflector"
require "enigma/rotor"

class Machine
  def initialize(rotors, reflector)
    @reflector = Reflector.new(reflector)
    @rotors = []
    rotors.each { |rotor_id| @rotors << Rotor.new(rotor_id) }
  end

  def encode_char(letter)
    @rotors.each { |rotor| letter = rotor.value_from_key(letter.upcase) }
    letter = @reflector.value_from_key(letter)
    @rotors.reverse.each { |rotor| letter = rotor.key_from_value(letter) }
    letter
  end

  def encode_string(str)
    plain_text = str.gsub(/[^A-Za-z]*/, "")
    cypher_text = []
    plain_text.chars.each { |char| cypher_text << encode_char(char) }
    cypher_text.join
  end
end
