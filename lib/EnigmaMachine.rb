require_relative '../lib/Rotor'
require_relative '../lib/Reflector'

class EnigmaMachine

  def initialize(ciphers, initial_orientations)
    @ciphers = ciphers
    @initial_orientations = initial_orientations
    @rotors = Array.new

    reset
  end

  def scramble(character)
    @rotors.each {
      |rotor| character = rotor.encode(character)
    }

    character
  end

  def reset
    index = 0
    @ciphers.each {
      |cipher| @rotors << Rotor.new(cipher, @initial_orientations[index], cipher.length * index)
      index += 1
    }
  end

end