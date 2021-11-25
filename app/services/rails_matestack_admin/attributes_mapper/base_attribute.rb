# frozen_string_literal: true

class RailsMatestackAdmin::AttributesMapper::BaseAttribute
  attr_reader :value
  def initialize(value)
    @value = value
  end
end
