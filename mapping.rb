class Mapping
  @@alphabet = "ABCDEFGHIJKLMNOPQRSTUVWXYZ"

  attr_reader :mapping

  def initialize(mappings, id)
    map = mappings[id.to_sym]
    raise Exception.new("Invalid mapping for [#{id}]") unless map.chars.sort.join == @@alphabet

    @mapping = {}
    (0..25).each do |index|
      @mapping[@@alphabet[index]] = map[index] 
    end
  end 

  def value_from_key(key)
    @mapping[key]
  end

  def key_from_value(value)
    @mapping.each { |k, v| return k if v == value }
  end
end 

