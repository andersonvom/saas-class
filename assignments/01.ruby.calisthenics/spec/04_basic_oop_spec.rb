require '04_basic_oop'


describe "Basic OOP" do

  before :each do
  end

  describe Dessert do
    before :each do
      @dessert = Dessert.new
    end
    subject { @dessert }

    it { should respond_to :name }
    it { should respond_to :calories }

    it "should identify healthy desserts" do
      @dessert.calories=(150)
        should be_healthy
      @dessert.calories=(250)
        should_not be_healthy
    end

    it "should identify delicious desserts" do
      should be_delicious
    end
  end

  describe JellyBean do
    before :each do
      @jelly_bean = JellyBean.new
    end
    subject { @jelly_bean }

    it { should respond_to :flavor }

    it { should be_a Dessert }

    it "should not be delicious if flavor is black licorice" do
      @jelly_bean.flavor=("black licorice")
        should_not be_delicious
      @jelly_bean.flavor=("other")
        should be_delicious
    end

  end

end

