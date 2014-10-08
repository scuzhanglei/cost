class NoticeMailer < ActionMailer::Base
  default from: "985742926@qq.com"
  def notice(new_entry)
    emails = User.pluck(:email)
    @new_entry = nnew_entry
    @entries = Entry.where('real_time >= ?', Time.now.beginning_of_month).order('real_time DESC')
    mail(to: emails, subject: "本月消费明细（#{Date.today.to_s}")
  end

  def notice_month_entry(date)
    emails = User.pluck(:email)
    @date =date
    @entries = Entry.where('real_time >= ? AND real_time <= ?', 
                           date.beginning_of_month, date.end_of_month.end_of_day)
                    .order('real_time DESC')
    mail(to: emails, subject: "#{date.month}月消费明细（#{Time.now.to_s}")
  end
end
