require '01_fun_with_strings'

describe Object do

  it "should recognize a palindrome" do
    palindrome?("A man, a plan, a canal -- Panama").should be_true
    palindrome?("Madam, I'm Adam!").should be_true
    palindrome?("Abracadabra").should be_false
  end

  it "should count words in a string" do
    count_words("A man, a plan, a canal -- Panama").should == ( {'a' => 3, 'man' => 1, 'canal' => 1, 'panama' => 1, 'plan' => 1})
    count_words("Doo bee doo bee doo").should == ({'doo' => 3, 'bee' => 2})
  end

end
