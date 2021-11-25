# frozen_string_literal: true

class RailsMatestackAdmin::DashboardController < RailsMatestackAdmin::ApplicationController
  def index
    render RailsMatestackAdmin::Pages::DashboardPage
  end
end
