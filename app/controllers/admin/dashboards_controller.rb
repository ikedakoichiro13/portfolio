class Admin::DashboardsController < ApplicationController
  layout 'admin'
  before_action :authenticate_admin!
  
  def index
    @users = User.all
  end
  
  protected
 
  def after_sign_in_path_for(resource)
    admin_dashboards_path
  end
 
  def after_sign_out_path_for(resource_or_scope)
    new_admin_session_path
  end
end
