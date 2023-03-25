require_relative "mapping"

class Rotor < Mapping
  def initialize(id)
    mappings = {
      I: "EKMFLGDQVZNTOWYHXUSPAIBRCJ",
      II: "AJDKSIRUXBLHWTMCQGZNPYFVOE",
      III: "BDFHJLCPRTXVZNYEIWGAKMUSQO",
      IV: "ESOVPZJAYQUIRHXLNFTGKDCMWB",
      V: "VZBRGITYUPSDNHLXAWMJQOFECK",
    }

    super(mappings, id) 
  end 
end 

