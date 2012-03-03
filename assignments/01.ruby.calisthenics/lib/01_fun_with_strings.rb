
def palindrome?(string)
  test_string = string.gsub(/[^\w]/,'').downcase
  test_string == test_string.reverse
end

