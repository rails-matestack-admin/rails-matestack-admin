# frozen_string_literal: true

RailsMatestackAdmin::Engine.routes.draw do
  root to: "dashboard#index"

  RailsMatestackAdmin::RailsService::ModelRoutes.new(self).load
end
