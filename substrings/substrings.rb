# frozen_string_literal: false

dictionary = %w[below down go going horn how howdy it i low own part partner sit]

def substrings(string, dictionary)
  dictionary.each_with_object({}) do |word, words|
    found = string.downcase.scan(/#{word}/).size
    words[word] = found if found.positive?
  end
end

p substrings('below', dictionary)
# {"below"=>1, "low"=>1}
p substrings('be?low!', dictionary)
# {"low"=>1}
p substrings('below!', dictionary)
# {"below"=>1, "low"=>1}
p substrings('sit it sit sit i', dictionary)
# {"it"=>4, "i"=>5, "sit"=>3}
p substrings("Howdy partner, sit down! How's it going?", dictionary)
# {"down"=>1, "go"=>1, "going"=>1, "how"=>2, "howdy"=>1, "it"=>2, "i"=>3, "own"=>1, "part"=>1, "partner"=>1, "sit"=>1}
