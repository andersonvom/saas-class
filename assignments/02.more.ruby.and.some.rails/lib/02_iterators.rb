class CartesianProduct
  include Enumerable
  
  attr_accessor :set_a, :set_b

  def initialize(a, b)
    self.set_a = a
    self.set_b = b
  end

  def each(&block)
    return Enumerator.new self unless block

    set_a.each do |a|
      set_b.each do |b|
        yield [a, b]
      end
    end
  end

end
