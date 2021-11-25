# frozen_string_literal: true

class RailsMatestackAdmin::Layout::SidebarNavigationItems::ClassManager
  delegate_missing_to :@ctx
  def initialize(ctx)
    @ctx = ctx
  end

  def rendered_items
    [
      *before_models,
      *rendered_models,
      *after_models
    ]
  end

  def rendered_models
    models.map do |model|
      pluralized_model_name = model.name.pluralize
      path_str = "#{pluralized_model_name.underscore}_path"

      sidebar_item(path: @ctx.send(path_str), text: pluralized_model_name, icon: "columns-gap")
    end
  end

  def models
    default_models
  end

  def default_models
    RailsMatestackAdmin::RailsService::Models.all_models.map(&:klass)
  end

  def before_models
    []
  end

  def after_models
    []
  end

  def sidebar_item(path:, text:, icon:)
    { type: :transition, path: path, text: text, icon: icon }
  end
end
