
# Groups an array of strings into anagram groups and returns the array of groups.
# Case doesn't matter in classifying string as anagrams (but case it is preserved
# in the output), and the order of the anagrams in the groups doesn't matter.
def combine_anagrams(words)
  groups = Hash.new []
  words.each do |w|
    key = w.downcase.chars.sort.join.to_sym
    groups[key] += [w]
  end
  groups.values
end

