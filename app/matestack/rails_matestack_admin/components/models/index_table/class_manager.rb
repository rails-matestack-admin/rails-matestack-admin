# frozen_string_literal: true

class RailsMatestackAdmin::Components::Models::IndexTable::ClassManager
  delegate_missing_to :@component
  attr_reader :component
  def initialize(component)
    @component = component
  end

  def query
    base_query
  end

  def render_columns
    result = {}
    table_columns.each do |attribute, attribute_klass|
      result[attribute] = {
        heading: format_header(attribute),
        slot: -> (record) do
          value = record.send(attribute)
          format_value(record, attribute, value, attribute_klass)
        end
      }
    end

    result
  end

  def table_columns
    sorted_attributes.select do |attribute|
      show_attribute?(attribute)
    end
  end

  def format_header(header)
    header.humanize
  end

  def show_attribute?(attribute)
    true
  end

  def format_value(_record, _name, value, attribute_klass)
    plain attribute_klass.new(value).render_in_table
  end

  def base_query
    model.all
  end

  def show_actions?
    true
  end

  def table_item_actions(record)
    transition path: path_for_record(record), delay: 300 do
      bs_btn outline: true, size: :sm, variant: :primary do
        bs_icon name: "arrow-right", size: 20
      end
    end
    extra_table_item_actions(record)
  end

  def extra_table_item_actions(record)
  end

  def path_for_record(record)
    method_name = "#{record.class.name.underscore}_path"
    component.send(method_name, record)
  end

  def sorted_attributes
    all_attributes.sort_by do |item|
      name = item[0]
      model.primary_key == name ? 0 : 1
    end.to_h
  end

  def all_attributes
    RailsMatestackAdmin::AttributesMapper.new(model).safe_attributes
  end
end
