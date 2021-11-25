# frozen_string_literal: true

class RailsMatestackAdmin::MatestackApp < Matestack::Ui::Core::App
  def response(&block)
    div class: "bg-primary" do
      plain "app navbar"
    end

    div(&block)

    div class: "bg-primary mt-4" do
      plain "app footer"
    end
  end
end
