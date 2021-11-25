# frozen_string_literal: true

class RailsMatestackAdmin::Pages::Models::IndexPage < RailsMatestackAdmin::Pages::Models::BasePage
  include RailsMatestackAdmin::ClassManagement
  def response
    class_manager.title
    class_manager.table
  end

  def class_manager_arguments
    self
  end
end
