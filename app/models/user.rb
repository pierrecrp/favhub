class User < ApplicationRecord
  has_many :lists
  has_many :favorites
  has_many :followed_users, through: :follows, source: :followed
  has_many :followers, through: :follows, source: :follower
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

end
