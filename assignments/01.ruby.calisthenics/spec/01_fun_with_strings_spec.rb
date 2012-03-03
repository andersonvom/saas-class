require '01_fun_with_strings'

describe Object do

  it "should recognize a palindrome" do
    palindrome?("A man, a plan, a canal -- Panama").should be_true
    palindrome?("Madam, I'm Adam!").should be_true
    palindrome?("Abracadabra").should be_false
  end

  it "should count words in a string"

end
