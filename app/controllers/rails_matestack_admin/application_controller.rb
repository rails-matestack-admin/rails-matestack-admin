# frozen_string_literal: true

class RailsMatestackAdmin::ApplicationController < ActionController::Base
  layout "rails_matestack_admin/application"
  include Matestack::Ui::Core::Helper
  matestack_app RailsMatestackAdmin::MatestackApp
end
