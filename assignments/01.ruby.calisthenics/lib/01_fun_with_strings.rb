# Determines whether a given word or phrase is a palindrome, that is,
# it reads the same backwards as forwards, ignoring case, punctuation, and
# nonword characters. (A "nonword character" is defined for our purposes as "a
# character that Ruby regexps would treat as a nonword character".)
def palindrome?(string)
  test_string = string.gsub(/[^\w]/,'').downcase
  test_string == test_string.reverse
end


# Given a string of input, return a hash whose keys are words in the string and whose
# values are the number of times each word appears. Nonwords are ignored. Case
# doesn't matter. A word is defined as a string of characters between word boundaries.
def count_words(string)
  word_count = Hash.new 0
  words.downcase.scan(/\w+/) {|w| word_count[w] += 1 }
  word_count
end

