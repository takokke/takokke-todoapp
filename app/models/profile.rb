# == Schema Information
#
# Table name: profiles
#
#  id           :bigint           not null, primary key
#  gender       :integer          default("other")
#  introduction :text
#  nickname     :string
#  created_at   :datetime         not null
#  updated_at   :datetime         not null
#  user_id      :bigint           not null
#
# Indexes
#
#  index_profiles_on_user_id  (user_id)
#
class Profile < ApplicationRecord
  enum gender: { male:0, female: 1, other: 2}
  belongs_to :user
end
