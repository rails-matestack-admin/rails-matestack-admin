# frozen_string_literal: true

class RailsMatestackAdmin::AttributesMapper::StringAttribute < RailsMatestackAdmin::AttributesMapper::BaseAttribute
  def render_in_table
    value
  end
end
