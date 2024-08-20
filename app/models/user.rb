class User < ApplicationRecord
  has_many :lists
  has_many :favorites
  has_many :followeds, class_name: "User", foreign_key: :followed_id
  has_many :followers, class_name: "User", foreign_key: :follower_id
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

end
