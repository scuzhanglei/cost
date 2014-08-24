class Entry < ActiveRecord::Base
  belongs_to :user
  belongs_to :cost_type
  validates :price, :user_id, :real_time, :cost_type_id, presence: true
  def price
    (read_attribute(:price) / 100.0).round(2)
  end

  def price=(value)
    send(:write_attribute, :price, (value.to_f * 100).round)
  end
end
