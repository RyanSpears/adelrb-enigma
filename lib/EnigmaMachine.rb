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
    puts '------------------------------'
    @rotors.each {
      |rotor| character = rotor.encode(character)
    }

    puts character
    character
  end

  def reset
    index = 0
    @ciphers.each {
      |cipher| @rotors << Rotor.new('Rotor ' + index.to_s, cipher, @initial_orientations[index], cipher.length * index + 1)
      index += 1
    }
  end

end