class NoticeWorker
  include Sidekiq::Worker

  def perform(entry_id)
    entry = Entry.find entry_id
    NoticeMailer.notice(entry).deliver!
  end
end
