require 'rspec'
require_relative '../lib/Rotor'

describe Rotor do
  describe '#encode' do
    context 'with simple cipher, 0 orientation and rotation_frequency of 1' do
      before do
        cipher = (0..2).to_a
        orientation = 0
        rotation_frequency = 1
        @rotor = Rotor.new(cipher, orientation, rotation_frequency)
      end

      it 'first encoding of 0 should return 0' do
        @rotor.encode(0).should == 0
      end

      it 'second encode of 0 should return 1' do
        @rotor.encode(0)
        @rotor.encode(0).should == 1
      end

      it 'third encode of 0 should return 2' do
        @rotor.encode(0)
        @rotor.encode(0)
        @rotor.encode(0).should == 2
      end

      it 'fourth encode of 0 should return 0' do
        @rotor.encode(0)
        @rotor.encode(0)
        @rotor.encode(0)
        @rotor.encode(0).should == 0
      end
    end

    context 'with simple cipher, orientation of 1 and rotation frequency of 1' do
      before do
        cipher = (0..2).to_a
        orientation = 1
        rotation_frequency = 1
        @rotor = Rotor.new(cipher, orientation, rotation_frequency)
      end

      it 'first encoding of 0 should return 1' do
        @rotor.encode(0).should == 1
      end

      it 'second encoding of 0 should return 2' do
        @rotor.encode(0)
        @rotor.encode(0).should == 2
      end

      it 'third encoding of 0 should return 0' do
        @rotor.encode(0)
        @rotor.encode(0)
        @rotor.encode(0).should == 0
      end
    end

    context 'with a cipher that does not contain Integers' do
      before do
        cipher = ('A'..'Z').to_a
        orientation = 0
        rotation_frequency = 1
        @reflector = Rotor.new(cipher, orientation, rotation_frequency)
      end

      it 'raises exception if scrambled is not an integer' do
        expect { @reflector.encode(0) }.to raise_error('Not an integer')
      end
    end

  end
end