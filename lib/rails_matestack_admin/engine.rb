# frozen_string_literal: true

class RailsMatestackAdmin::Engine < ::Rails::Engine
  isolate_namespace RailsMatestackAdmin

  initializer "rails_matestack_admin.assets.precompile" do |app|
    app.config.assets.precompile << "rails_matestack_admin/application.css"
    app.config.assets.precompile << "rails_matestack_admin/application.js"
  end

  initializer "rails_matestack_admin.importmap", before: "importmap" do |app|
    app.config.importmap.paths << RailsMatestackAdmin::Engine.root.join("config/importmap.rb")
  end
end
