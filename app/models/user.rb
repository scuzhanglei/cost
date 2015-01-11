class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
  has_many :entries
  validate :name, presence: true, unique: true
  USER_TYPE_ADMIN = 2
  def admin?
    user_type == USER_TYPE_ADMIN
  end
end
