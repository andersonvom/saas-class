require '02_iterators'

describe "Iterators" do

  before :each do
    a = [:a, :b, :c]
    b = [4,5]
    @product = CartesianProduct.new a, b
    @result = [[:a,4],[:a,5],[:b,4],[:b,5],[:c,4],[:c,5]]
    @empty_product = CartesianProduct.new a, []
    @inverse_product = CartesianProduct.new b, a
  end

  subject { @product }

  it "should be enumerable" do
    should respond_to :each
  end

  it "should return the correct product" do
    collect { |e| e }.sort.should == @result.sort
  end

  it "should calculate the correct empty product" do
    @empty_product.collect { |e| e }.should be_empty
  end

  it "should calculate different products (axb and bxa)" do
    collect { |e| e }.sort.should_not == @inverse_product.collect { |e| e }.sort
  end

end
