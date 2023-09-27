# == Schema Information
#
# Table name: users
#
#  id                     :bigint           not null, primary key
#  email                  :string           default(""), not null
#  encrypted_password     :string           default(""), not null
#  remember_created_at    :datetime
#  reset_password_sent_at :datetime
#  reset_password_token   :string
#  created_at             :datetime         not null
#  updated_at             :datetime         not null
#
# Indexes
#
#  index_users_on_email                 (email) UNIQUE
#  index_users_on_reset_password_token  (reset_password_token) UNIQUE
#
class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :boards, dependent: :destroy
  has_one :profile, dependent: :destroy
  has_many :tasks, dependent: :destroy

  def display_name
    profile&.nickname || self.email.split('@')[0]
  end

  def display_gender
    profile&.gender
  end

  def display_introduction
    profile&.introduction
  end

  def avatar_image
    if self.profile&.avatar&.attached?
      self.profile.avatar
    else
      'default-avatar.png'
    end
  end
end
