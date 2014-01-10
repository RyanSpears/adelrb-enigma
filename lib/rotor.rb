class Rotor
  def initialize(rotor_name, cipher, orientation, rotation_frequency)
    @rotor_name = rotor_name
    @encode_cipher = cipher
    @orientation = orientation
    @rotation_frequency = rotation_frequency
    @scramble_count = 0
  end

  def encode(cipher_index)

    raise 'Out of range' if cipher_index < 0 or cipher_index > @encode_cipher.length

    scrambled = @encode_cipher[(cipher_index + @orientation) % @encode_cipher.length]

    raise 'Not an integer' if not scrambled.is_a? Integer

    print @rotor_name + ': cipher_index is ' + cipher_index.to_s + ', orientation is ' + @orientation.to_s
    print ' rotation_frequency is ' + @rotation_frequency.to_s + ': scramble_count is ' + @scramble_count.to_s
    puts ' scrambled is ' + scrambled.to_s

    # Change orientation if necessary
    @scramble_count += 1
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