task :create_admin => :environment do
  if ENV['name'].blank?
    puts "bundle exec rake create_admin name=xxxxx"
    exit
  end
  user = User.where(name: ENV['name'].to_s.strip).first
  if user.blank?
    puts "用户不存在"
    exit
  end
  user.update_attributes(user_type: User::USER_TYPE_ADMIN)
  puts "#{user.name},被成功设置为管理员！"
end
