class AdminController < ApplicationController
  before_action :require_admin

  def require_admin
    redirect_to contacts_path unless current_user.try(:admin)
  end
end
