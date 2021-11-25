# frozen_string_literal: true

class RailsMatestackAdmin::Pages::HomePage < RailsMatestackAdmin::ApplicationPage
  def response
    div do
      h1 "home page"
    end

    RailsMatestackAdmin::Components::HomeButton.call
  end
end
