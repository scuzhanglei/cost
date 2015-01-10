class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  before_action :configure_permitted_parameters, if: :devise_controller?
  protect_from_forgery with: :exception
  def must_self_entry!
    if @entry.user_id != current_user.id
      raise "你只能编辑自己的记录！"
    end
  end

  def configure_permitted_parameters
    devise_parameter_sanitizer.for(:sign_up) << :name
  end

end
