# frozen_string_literal: true

module RailsMatestackAdmin::BaseModelController
  extend ActiveSupport::Concern
  include RailsMatestackAdmin::ClassManagement

  included do
    layout "rails_matestack_admin/application"
    matestack_app RailsMatestackAdmin::MatestackApp

    before_action :authorize_action
  end

  def index
    render RailsMatestackAdmin::Pages::Models::IndexPage
  end

  def authorize_action
    return if class_manager.can_call_action?(action_name)

    redirect_to root_path, notice: class_manager.unauthorized_message
  end

  def class_manager_arguments
    self
  end

  private
    def model
      return @model if defined? @model
      model = self.class.name.match(/RailsMatestackAdmin::(.*)Controller/)[1]
      @model = model.singularize.constantize
    end
end
