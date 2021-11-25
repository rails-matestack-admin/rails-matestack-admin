# frozen_string_literal: true

class RailsMatestackAdmin::BaseModelController::ClassManager
  attr_reader :ctrl
  def initialize(ctrl)
    @ctrl = ctrl
  end

  def can_call_action?(_action_name)
    true
  end

  def unauthorized_message
    "Unauthorized"
  end
end
