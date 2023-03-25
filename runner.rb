require_relative "rotor"
require_relative "reflector"
require_relative "enigma"

enigma = Enigma.new(["I", "II", "III"], "A") 
encoded = enigma.encode_string("hello")
decoded = enigma.encode_string(encoded)
puts encoded 
puts decoded