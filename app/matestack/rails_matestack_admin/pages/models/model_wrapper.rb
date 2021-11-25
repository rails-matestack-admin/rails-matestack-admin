# frozen_string_literal: true

class RailsMatestackAdmin::Pages::Models::ModelWrapper
  attr_reader :page
  delegate_missing_to :model_klass

  def initialize(page)
    @page = page
  end

  def model_klass
    return @model_klass if defined? @model_klass
    controller_name = page.controller.class.name

    klass_name = controller_name.match(/RailsMatestackAdmin::(.*)Controller/)[1].singularize
    @model_klass = klass_name.constantize
  end

  def attributes_map
  end

  def resource_name
    model_klass.name.pluralize
  end
end
