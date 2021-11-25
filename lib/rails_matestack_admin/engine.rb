# frozen_string_literal: true

class RailsMatestackAdmin::Engine < ::Rails::Engine
  isolate_namespace RailsMatestackAdmin

  initializer "rails_matestack_admin.assets.precompile" do |app|
    app.config.assets.paths << RailsMatestackAdmin::Engine.root.join("vendor/assets")
    app.config.assets.precompile << "rails_matestack_admin/application.css"
    app.config.assets.precompile << "rails_matestack_admin/application.js"
    app.config.assets.precompile << "icons/bootstrap-icons.svg"
  end

  initializer "rails_matestack_admin.importmap", before: "importmap" do |app|
    app.config.importmap.paths << RailsMatestackAdmin::Engine.root.join("config/importmap.rb")
  end

  def call(env)
    req = build_request(env)
    app.call req.env

  rescue ActionController::RoutingError => e
    controller_name = e.message.match(/uninitialized constant (.*)/)[1]
    reloadable_controllers << RailsMatestackAdmin::ControllersService::BuildController.build(controller_name)
    setup_reload
    call(env)
  end

  def reloadable_controllers
    @reloadable_controllers ||= Set.new
  end

  def setup_reload
    return if @setup_reload
    @setup_reload = true

    ref = self
    Rails.application.reloader.to_prepare do
      ref.reloadable_controllers.each(&:reload)
    end
  end
end
