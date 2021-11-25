# frozen_string_literal: true

class RailsMatestackAdmin::Pages::Models::IndexPage::ClassManager
  delegate_missing_to :@page
  def initialize(page)
    @page = page
  end

  def title
    h1 model.resource_name if show_title?
  end

  def table
    RailsMatestackAdmin::Components::Models::IndexTable.(model: model) if show_table?
  end

  def show_title?
    true
  end

  def show_table?
    true
  end
end
