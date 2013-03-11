class Track < ActiveRecord::Base
  attr_accessible :description, :level, :name

  belongs_to :user
end
