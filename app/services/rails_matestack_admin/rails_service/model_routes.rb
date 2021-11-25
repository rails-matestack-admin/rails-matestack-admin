# frozen_string_literal: true

class RailsMatestackAdmin::RailsService::ModelRoutes
  delegate_missing_to :@ctx
  def initialize(ctx)
    @ctx = ctx
  end

  def load
    RailsMatestackAdmin::RailsService::Models.all_models.each do |model|
      resources model.resource_name do
      end
    end
  end
end
