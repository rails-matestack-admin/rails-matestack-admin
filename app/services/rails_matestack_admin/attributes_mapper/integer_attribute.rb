# frozen_string_literal: true

class RailsMatestackAdmin::AttributesMapper::IntegerAttribute < RailsMatestackAdmin::AttributesMapper::BaseAttribute
  def render_in_table
    value
  end
end
