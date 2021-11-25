# frozen_string_literal: true

module RailsMatestackAdmin::ClassManagement
  def class_manager
    return @class_manager if defined? @class_manager
    args = class_manager_arguments
    klass = klass_for_class_manager.constantize
    return @class_manager = klass.new(*args) if args.is_a?(Array)
    @class_manager = klass.new(args)
  end

  def klass_for_class_manager
    "#{self.class.name}::ClassManager"
  end
end
