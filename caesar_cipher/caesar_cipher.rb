# frozen_string_literal: false

def upcase?(char_code)
  char_code.between?(65, 90)
end

def downcase?(char_code)
  char_code.between?(97, 122)
end

def valid_char?(char_code)
  upcase?(char_code) || downcase?(char_code)
end

def alphabet_range(char_code)
  return false unless valid_char?(char_code)

  if upcase?(char_code)
    { start: 65, end: 90 }
  else
    { start: 97, end: 122 }
  end
end

def alphabet_range?(alphabet, char_code)
  char_code.between?(alphabet[:start], alphabet[:end])
end

def fix_char_code(alphabet, char_code)
  return char_code if alphabet_range?(alphabet, char_code)

  new_code = if char_code > alphabet[:end]
               -1 - alphabet[:end] + alphabet[:start]
             else
               +1 - alphabet[:start] + alphabet[:end]
             end
  char_code += new_code
  char_code
end

def encrypt_char(char_code, shift)
  encrypted_char = ''
  return encrypted_char << char_code unless valid_char?(char_code)

  alphabet = alphabet_range(char_code)
  shift %= 26
  next_code = fix_char_code(alphabet, char_code + shift)
  encrypted_char << next_code
end

def caesar_cipher(text, shift)
  cipher_text = ''

  text.each_codepoint { |char_code| cipher_text += encrypt_char(char_code, shift) }

  cipher_text
end

p caesar_cipher('What a string! a', 5)
