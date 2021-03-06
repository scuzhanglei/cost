class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  before_action :configure_permitted_parameters, if: :devise_controller?
  protect_from_forgery with: :exception
  layout 'admin'
  def must_self_entry!
    if @entry.user_id != current_user.id
      raise "你只能编辑自己的记录！"
    end
  end

  def configure_permitted_parameters
    devise_parameter_sanitizer.for(:sign_up) << :name
  end

  def check_admin
    unless current_user && current_user.admin?
      render text: "#{current_user.try(:name)},没有管理员权限"
    end
  end
end
