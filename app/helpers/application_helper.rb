module ApplicationHelper
  def user_info
    if current_user
      raw "Welcome: <a href=#{edit_user_registration_path}>#{ current_user.name}</a>"
    else
      raw "<a href=#{new_user_registration_path}>注册</a> |
      <a href=#{new_user_session_path}>登录</a>"
    end
  end

  def admin?
    current_user && current_user.admin?
  end

end
