class User < ActiveRecord::Base
  has_many :entries
  validate :name, presence: true, unique: true
end
