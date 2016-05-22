# == Schema Information
#
# Table name: profiles
#
#  id               :integer          not null, primary key
#  user_id          :integer
#  username         :string
#  latest_point_lat :float
#  latest_point_lng :float
#  mapper           :boolean
#  created_at       :datetime         not null
#  updated_at       :datetime         not null
#

class Profile < ActiveRecord::Base
  belongs_to :user
  has_many :points
end
