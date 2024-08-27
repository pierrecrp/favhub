class User < ApplicationRecord
  has_many :lists
  has_many :favorites
  has_many :tags
  has_many :followeds, class_name: "Follow", foreign_key: :followed_id
  has_many :followers, class_name: "Follow", foreign_key: :follower_id
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  def followeds_list
    followers.pluck(:followed_id)
  end

  def public_lists
    self.lists.where(public: true)
  end
end
