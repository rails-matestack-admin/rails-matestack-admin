# frozen_string_literal: true

class RailsMatestackAdmin::AttributesMapper::AttributeFactory
  attr_reader :attribute
  def initialize(attribute)
    @attribute = attribute
  end

  def call
    {
      @attribute.name => klass_for_attribute
    }
  end

  def klass_for_attribute
    if attribute.type == :datetime
      RailsMatestackAdmin::AttributesMapper::DatetimeAttribute
    elsif attribute.type == :integer
      RailsMatestackAdmin::AttributesMapper::IntegerAttribute
    else
      RailsMatestackAdmin::AttributesMapper::StringAttribute
    end
  end
end
