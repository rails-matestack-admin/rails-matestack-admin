# frozen_string_literal: true

class RailsMatestackAdmin::RailsService::Models
  def self.all_models
    Dir.glob(Rails.root.join("app/models/**/*.rb").to_s) do |model_path|
      require model_path rescue Exception
    end

    ActiveRecord::Base.descendants.filter_map do |klass|
      next if klass.abstract_class?
      next if klass.name == "ActiveRecord::SchemaMigration"
      ModelWrapper.new(klass)
    end
  end

  class ModelWrapper
    attr_reader :klass

    def initialize(klass)
      @klass = klass
    end

    def resource_name
      klass.name.underscore.tr("/", "_").pluralize
    end
  end
end
