require 'rspec'
require_relative '../lib/Reflector'

describe Reflector, 'when reflecting simple input to output' do

  describe '#reflect' do
    context 'with simple cipher' do

      before do
        cipher = (0..2).to_a
        @reflector = Reflector.new(cipher)
      end

      it('reflecting 0 should return 0')  { expect(@reflector.reflect(0)).to eq(0) }

      it('reflecting 0 twice should return 0 both times') {
        expect(@reflector.reflect(0)).to eq(0)
        expect(@reflector.reflect(0)).to eq(0)
      }

      it('reflecting 1 should return 1') { expect(@reflector.reflect(1)).to eq(1) }

      it('reflecting 2 should return 2') { expect(@reflector.reflect(2)).to eq(2) }

    end

    context "with a cipher that does not contain Integers" do

      before do
        cipher = ('A'..'Z').to_a
        @reflector = Reflector.new(cipher)
      end

      it "raises exception if cipher is not an integer" do
        expect { @reflector.reflect(0) }.to raise_error("Not an integer")
      end
    end
  end
end