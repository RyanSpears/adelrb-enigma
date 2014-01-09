class Reflector
  def initialize(reflection_cipher)
    @reflection_cipher = reflection_cipher
  end

  def reflect(input_index)
    reflection = @reflection_cipher[input_index]

    raise 'Not an integer' if not reflection.is_a? Integer

    reflection
  end
end