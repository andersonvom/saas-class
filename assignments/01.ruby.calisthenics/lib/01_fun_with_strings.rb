
# Determines whether a given word or phrase is a palindrome, that is,
# it reads the same backwards as forwards, ignoring case, punctuation, and
# nonword characters. (A "nonword character" is defined for our purposes as "a
# character that Ruby regexps would treat as a nonword character".)
def palindrome?(string)
  test_string = string.gsub(/[^\w]/,'').downcase
  test_string == test_string.reverse
end


