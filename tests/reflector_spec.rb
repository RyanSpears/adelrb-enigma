require 'rspec'
require_relative '../lib/Reflector'

describe Reflector, 'when reflecting simple input to output' do

  describe '#reflect' do
    context 'with simple cipher' do

      before do
        cipher = (0..2).to_a
        @reflector = Reflector.new(cipher)
      end

      it('reflecting 0 should return 0') { @reflector.reflect(0).should == 0 }

      it('reflecting 0 twice should return 0 both times') {
        @reflector.reflect(0).should == 0
        @reflector.reflect(0).should == 0
      }

      it('reflecting 1 should return 1') { @reflector.reflect(1).should == 1 }

      it('reflecting 2 should return 2') { @reflector.reflect(2).should == 2 }

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