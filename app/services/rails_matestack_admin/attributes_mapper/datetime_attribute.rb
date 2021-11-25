# frozen_string_literal: true

class RailsMatestackAdmin::AttributesMapper::DatetimeAttribute < RailsMatestackAdmin::AttributesMapper::BaseAttribute
  def render_in_table
    value&.to_formatted_s(:short)
  end
end
