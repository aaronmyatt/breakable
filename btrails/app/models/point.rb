# == Schema Information
#
# Table name: points
#
#  id         :integer          not null, primary key
#  lat        :string
#  lng        :string
#  profile_id :integer
#  note       :string
#

class Point < ActiveRecord::Base
  belongs_to :profile
end
