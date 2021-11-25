# frozen_string_literal: true

class RailsMatestackAdmin::Pages::Models::BasePage < RailsMatestackAdmin::ApplicationPage
  def model
    RailsMatestackAdmin::Pages::Models::ModelWrapper.new(self)
  end
end
