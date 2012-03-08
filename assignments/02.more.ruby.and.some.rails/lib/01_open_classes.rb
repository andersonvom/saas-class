class Numeric
  
  @@currencies = {'dollar' => 1, 'yen' => 0.013, 'euro' => 1.292, 'rupee' => 0.019}
  
  def method_missing(method_id)
    singular_currency = method_id.to_s.gsub( /s$/, '')
    if @@currencies.has_key?(singular_currency)
      self * @@currencies[singular_currency]
    else
      super
    end
  end

  def in(currency)
    singular_currency = currency.to_s.gsub(/s$/, '')
    self / @@currencies[singular_currency]
  end

end

class String
  def palindrome?
    test_string = self.gsub(/[^\w]/,'').downcase
    test_string == test_string.reverse
  end
end

module Enumerable
  def palindrome?
    elements = self.collect {|i| i}
    elements == elements.reverse
  end
end

