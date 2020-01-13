class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  # has_many :comments
  has_many :plans
  has_many :add_user_to_groups
  has_many :groups, :through => :add_user_to_groups
  attachment :profile_image
  validates :name, presence: true
  validates :account_id, presence: true, uniqueness: true, length: { in: 8..12 }

end
