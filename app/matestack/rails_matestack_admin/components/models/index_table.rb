# frozen_string_literal: true

class RailsMatestackAdmin::Components::Models::IndexTable < RailsMatestackAdmin::ApplicationComponent
  include RailsMatestackAdmin::ClassManagement
  requires :model
  delegate :model, to: :context

  def response
    bs_smart_collection collection_config
  end

  def collection_config
    {
      id: model.resource_name,
      items: class_manager.query,
      paginate: 10,
      rerender_on: "success",
      hoverable: true,
      columns: class_manager.render_columns,
      filters: {

      },
      slots: actions_slots
    }
  end

  def class_manager_arguments
    self
  end

  def actions_slots
    return unless class_manager.show_actions?
    {
      table_item_actions: class_manager.method(:table_item_actions)
    }
  end
end
