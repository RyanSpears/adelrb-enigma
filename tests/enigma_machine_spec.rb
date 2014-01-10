require 'rspec'

require_relative '../lib/Rotor'
require_relative '../lib/Reflector'
require_relative '../lib/EnigmaMachine'

describe EnigmaMachine, 'when scrambling clear text' do

  describe '#scramle' do
    context 'with three simple ciphers with three characters each' do

      before do
        ciphers = Array.new
        ciphers << cipher_for_rotor1 = (0..2).to_a
        ciphers << cipher_for_rotor2 = (0..2).to_a
        ciphers << cipher_for_rotor3 = (0..2).to_a

        rotor_key_settings = [0,0,0]

        @enigma_machine = EnigmaMachine.new(ciphers, rotor_key_settings)
      end

      it('encrypt character 0 a first time should return 0') {
        expect(@enigma_machine.scramble(0)).to eq(0)
      }

      it('encrypt character 0 a second time should return 0') {
        @enigma_machine.scramble(0)
        expect(@enigma_machine.scramble(0)).to eq(1)
      }

    end
  end
end