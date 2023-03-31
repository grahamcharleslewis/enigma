# frozen_string_literal: true

class Mapping
  attr_reader :alphabet, :mapping

  def initialize(mappings, id)
    @alphabet = "ABCDEFGHIJKLMNOPQRSTUVWXYZ"

    map = mappings[id.to_sym]
    raise StandardError, "Invalid mapping for [#{id}]" unless map.chars.sort.join == @alphabet

    @mapping = {}
    26.times do |index|
      @mapping[@alphabet[index]] = map[index]
    end
  end

  def value_from_key(key)
    @mapping[key]
  end

  def key_from_value(value)
    @mapping.each { |k, v| return k if v == value }
  end
end
