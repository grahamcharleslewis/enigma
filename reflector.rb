require_relative "mapping"

class Reflector < Mapping
  def initialize(id)
    mappings = {
      A: "EJMZALYXVBWFCRQUONTSPIKHGD",
      B: "YRUHQSLDPXNGOKMIEBFZCWVJAT",
      C: "FVPJIAOYEDRZXWGCTKUQSBNMHL",
    }

    super(mappings, id)
  end 
end 

