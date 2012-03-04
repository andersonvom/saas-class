require '05_advanced_oop'

describe Class do

  it "should have an attr_accessor_with_history method" do
    #Foo.private_methods.should include :attr_accessor_with_history
    Foo.should respond_to :attr_accessor_with_history
  end 

  it "should have an attr_name_history getter" do
    f = Foo.new
    f.should respond_to :bar_history
  end

  it "should keep instance variables histories" do
    f = Foo.new
    f.bar = 3
    f.bar = :wowzo
    f.bar = 'boo!'
    f.bar_history.should ==  [nil, 3, :wowzo, 'boo!']
  end

  it "should maintain separate histories for different objects" do
    f = Foo.new
    f.bar = 1
    f.bar = 2
    f.bar_history.should == [nil, 1, 2]
    f = Foo.new
    f. bar = 4
    f.bar_history.should == [nil, 4]
  end

  it "should keep correct values even if object was previously  initialized" do
    f = Foo.new(1)
    f.bar = 2
    f.bar = 3
    f.bar_history.should == [1,2,3]
    f.zoo_history.should == nil
    f.zoo = 99
    f.zoo_history.should == [nil, 99]
  end

end

