require '01_open_classes'

describe "open classes, metaprogramming, duck typing" do

  before :each do
    @currencies = %w(dollar euro rupee yen)
  end

  it "should convert to euros (1.292)" do
    6.euros.should == 7.752
  end

  it "should convert to rupees (0.019)" do
    7.rupees.should == 0.133
  end

  it "should convert to yen (0.013)" do
    8.yens.should == 0.104
  end

  it "should convert to dollars (1)" do
    9.75.dollars.should == 9.75
  end

  it "should accept singular and plural forms of conversion" do
    @currencies.each do |singular_currency|
      plural_currency = "#{singular_currency}s"
      5.send(singular_currency).should be_a Numeric
      5.send(plural_currency).should be_a Numeric
    end
  end

  it "should convert currency into another one" do
    7.dollars.in(:euros).should == 5.418
    7.euros.in(:rupees).should == 476
    7.rupees.in(:yens).should == 10.231
    7.yens.in(:dollars).should == 0.091
  end

  it "should accept singular and plural symbols" do
    @currencies.each do |singular_currency|
      plural_currency = "#{singular_currency}s"
      7.dollars.in(singular_currency.to_sym).should be_a Numeric
      7.dollars.in(plural_currency.to_sym).should be_a Numeric
    end
  end

end

