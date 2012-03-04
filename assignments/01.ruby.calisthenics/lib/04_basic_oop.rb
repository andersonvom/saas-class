
class Dessert
  attr_accessor :name, :calories

  HEALTHY_THRESHOLD = 200

  def initialize(name = nil, calories = nil)
    @name = name
    @calories = calories
  end

  def healthy?
    @calories < HEALTHY_THRESHOLD
  end

  def delicious?
    true
  end
end

class JellyBean < Dessert
  attr_accessor :flavor

  def initialize(name = nil, calories = nil, flavor = nil)
    super(name, calories)
    @flavor = flavor
  end

  def delicious?
    return false if @flavor == "black licorice"
    super
  end

end

