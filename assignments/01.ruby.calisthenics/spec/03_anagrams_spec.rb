require '03_anagrams'


describe "Anagrams" do

  before :each do
    @words = ['cars', 'for', 'potatoes', 'racs', 'four','scar', 'creams', 'scream']
    @groups = [["cars", "racs", "scar"], ["four"], ["for"], ["potatoes"], ["creams", "scream"]].sort
  end

  it "should raise error if number of players is not 2" do
    combine_anagrams(@words).sort.should == @groups
  end

end

