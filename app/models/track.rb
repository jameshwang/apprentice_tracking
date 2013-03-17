# == Schema Information
#
# Table name: tracks
#
#  id          :integer          not null, primary key
#  name        :string(255)
#  description :string(255)
#  level       :string(255)
#  user_id     :integer
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#  timer       :integer          default(0)
#

class Track < ActiveRecord::Base
  attr_accessible :description, :level, :name, :timer

  belongs_to :user

  validates :name, :presence => true
end
