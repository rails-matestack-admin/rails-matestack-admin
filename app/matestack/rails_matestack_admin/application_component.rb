# frozen_string_literal: true

class RailsMatestackAdmin::ApplicationComponent < Matestack::Ui::Core::Component
  include Matestack::Ui::Bootstrap::Registry
  include RailsMatestackAdmin::Engine.routes.url_helpers
end
