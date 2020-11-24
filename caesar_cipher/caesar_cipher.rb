def encrypt_char(char_code, shift)
  encrypted_char = ""

  #  2 for upcase
  #  1 for downcase
  # -1 for invalid alphabet char
  valid_char = char_code.between?(97, 122) ? 1 : char_code.between?(65, 90) ? 2 : -1

  unless valid_char > 0
    return encrypted_char << char_code
  end

  upcase = valid_char > 1
  start = upcase ? 65 : 97
  limit = upcase ? 90 : 122 

  shift %= 26
  next_code = char_code + shift

  unless next_code.between?(start, limit)
    reduce_code = next_code > limit ? -1 - limit + start : +1 - start + limit
    next_code += reduce_code
  end

  encrypted_char << next_code
end

def caesar_cipher(text, shift)
  cipherText = ""

  text.each_codepoint { | char_code | cipherText += encrypt_char(char_code, shift) }
  
  return cipherText
end

p caesar_cipher("What a string! a", 5)