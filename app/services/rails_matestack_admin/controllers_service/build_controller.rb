# frozen_string_literal: true

class RailsMatestackAdmin::ControllersService::BuildController
  def self.build(controller_name)
    ControllerClassWrapper.new(controller_name).define
  end

  class ControllerClassWrapper
    attr_reader :name

    def initialize(name)
      @name = name
    end

    def ==(other_wrapper)
      name == other_wrapper.name
    end

    def define
      RailsMatestackAdmin.const_set(controller_name, klass)
      self
    end

    def klass
      @klass ||= Class.new(RailsMatestackAdmin::ApplicationController) do
        include RailsMatestackAdmin::BaseModelController
      end
    end

    def controller_name
      @controller_name ||= name.split("::").last
    end

    def reload
      klass.include RailsMatestackAdmin::BaseModelController
    end
  end
end
