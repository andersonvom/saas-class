require '01_open_classes'

describe "Open Classes" do

  before :each do
    @precision = 0.001
    @currencies = %w(dollar euro rupee yen)
  end

  it "should convert to euros (1.292)" do
    6.euros.should be_within(@precision).of 7.752
  end

  it "should convert to rupees (0.019)" do
    7.rupees.should be_within(@precision).of 0.133
  end

  it "should convert to yen (0.013)" do
    8.yens.should be_within(@precision).of 0.104
  end

  it "should convert to dollars (1)" do
    9.75.dollars.should be_within(@precision).of 9.75
  end

  it "should accept singular and plural forms of conversion" do
    @currencies.each do |singular_currency|
      plural_currency = "#{singular_currency}s"
      5.send(plural_currency).should   be_a Numeric
      5.send(singular_currency).should be_a Numeric
    end
  end

  it "should convert currency into another one" do
    7.dollars.in(:euros).should be_within(@precision).of   5.418
    7.euros.in(:rupees).should  be_within(@precision).of 476.000
    7.rupees.in(:yens).should   be_within(@precision).of  10.231
    7.yens.in(:dollars).should  be_within(@precision).of   0.091
  end

  it "should accept singular and plural symbols" do
    @currencies.each do |singular_currency|
      plural_currency = "#{singular_currency}s"
      7.dollars.in(singular_currency.to_sym).should be_a Numeric
      7.dollars.in(plural_currency.to_sym).should be_a Numeric
    end
  end

end

