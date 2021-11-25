# frozen_string_literal: true

class RailsMatestackAdmin::Components::HomeButton < RailsMatestackAdmin::ApplicationComponent
  def response
    async id: "rerendering-async", rerender_on: "update-time" do
      paragraph DateTime.now
    end

    onclick emit: "update-time" do
      bs_btn "Update Time"
    end
  end
end
