# frozen_string_literal: true

class RailsMatestackAdmin::AttributesMapper
  attr_reader :model
  def initialize(model)
    @model = model
  end

  def attributes
    model.columns.map do |attribute|
      RailsMatestackAdmin::AttributesMapper::AttributeFactory.new(attribute).call
    end.inject(:merge)
  end

  def safe_attributes
    attributes.select do |attribute|
      !filtered_parameters.detect do |filtered_param|
        attribute.include?(filtered_param)
      end
    end
  end

  def filtered_parameters
    @filtered_parameters ||= Rails.application.config.filter_parameters.map(&:to_s)
  end
end
