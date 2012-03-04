
class Class

  # provides the same functionality as attr_accessor but also
  # tracks every value the attribute has ever had. 
  def attr_accessor_with_history(*attr_names)
    attr_names.each do |attr|
      attr_name = attr.to_s
      attr_reader attr_name
      attr_reader "#{attr_name}_history"
      class_eval %Q{
        def #{attr_name}=(value)
          @#{attr_name}_history ||= [ (@#{attr_name} || nil) ]
          @#{attr_name}_history << value
          @#{attr_name} = value
        end
      }
    end
  end
end

class Foo
  attr_accessor_with_history :bar, :zoo

  def initialize(bar = nil, zoo = nil)
    @bar = bar
    @zoo = zoo
  end

end

