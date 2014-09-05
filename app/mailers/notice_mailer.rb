class NoticeMailer < ActionMailer::Base
  default from: "985742926@qq.com"
  def notice(new_entry)
    emails = User.pluck(:email)
    @new_entry = new_entry
    @entries = Entry.where('real_time >= ?', Time.now.beginning_of_month).order('real_time DESC')
    mail(to: emails, subject: "本月消费明细（#{Date.today.to_s}")
  end
end
