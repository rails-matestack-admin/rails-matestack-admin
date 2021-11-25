# frozen_string_literal: true

class RailsMatestackAdmin::ApplicationPage < Matestack::Ui::Core::Page
  include Matestack::Ui::Bootstrap::Registry
  include RailsMatestackAdmin::Engine.routes.url_helpers
end
