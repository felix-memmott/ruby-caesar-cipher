def shift_letter(letter, shift_value)
  is_upcase = letter == letter.upcase
  base = is_upcase ? 'A'.ord : 'a'.ord
  shifted_ascii = ((letter.ord - base + shift_value.to_i % 26) % 26) + base
  shifted_ascii.chr
end

def caesar_cipher(text, shift_value = 0)
  raise ArgumentError, "Text must be a string" unless text.is_a?(String)
  raise ArgumentError, "Shift value must be a number" unless shift_value.is_a?(Numeric)
  
  text.chars.map do |letter|
    if letter.match?(/[a-zA-Z]/)
      shift_letter(letter, shift_value)
    else
      letter
    end
  end.join
end
