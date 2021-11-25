# frozen_string_literal: true

class RailsMatestackAdmin::Layout::SidebarNavigationItems
  include RailsMatestackAdmin::ClassManagement

  def initialize(ctx)
    @ctx = ctx
  end

  def call
    class_manager.rendered_items
  end

  def class_manager_arguments
    @ctx
  end
end
