class Rotor
  def initialize(cipher, orientation, rotation_frequency)
    @encode_cipher = cipher
    @orientation = orientation
    @rotation_frequency = rotation_frequency
    @scramble_count = 0
  end

  def encode(cipher_index)
    raise 'Out of range' if cipher_index < 0 or cipher_index > @encode_cipher.length

    scrambled = @encode_cipher[(cipher_index + @orientation) % @encode_cipher.length]

    raise 'Not an integer' if not scrambled.is_a? Integer

    # Change orientation if necessary
    @scramble_count +=1
    if @scramble_count % @rotation_frequency == 0
      @orientation = (@orientation + 1)  % @encode_cipher.length
    end

    return scrambled
  end

  private

  def create_decode_array
    @decode_cipher = []
    @encode_cipher.each { |elem| @decode_cipher << elem }
  end
end