# frozen_string_literal: true

class RailsMatestackAdmin::MatestackApp < Matestack::Ui::Bootstrap::Apps::AdminTemplate
  include RailsMatestackAdmin::Engine.routes.url_helpers

  def sidebar_top_partial
    div class: "text-center" do
      transition path: root_path, delay: 300 do
        heading size: 4, text: "Rails Matestack Admin"
      end
    end
    div class: "text-center my-5" do
      # bs_avatar img_path: asset_pack_url('media/images/avatar-placeholder.png')
      div class: "mt-3" do
        # plain current_admin.email
      end
      action sign_out_config do
        bs_btn variant: :link, size: :sm, class: "text-muted" do
          # bs_icon name: "box-arrow-in-right", size: 25
        end
      end
    end
  end

  def sidebar_navigation_items
    RailsMatestackAdmin::Layout::SidebarNavigationItems.new(self).call
  end

  def sign_out_config
    {
      method: :get,
      path: "",
      success: {
        redirect: {
          follow_response: true
        }
      }
    }
  end

  def toasts
    [
      { show_on: "failure", class: "bg-danger text-white", body: "{{ eventData.message }}".html_safe },
      { show_on: "success", class: "bg-primary text-white", body: "Performed successfully" },
    ]
  end
end
