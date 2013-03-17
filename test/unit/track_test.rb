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

require 'test_helper'

class TrackTest < ActiveSupport::TestCase
  test "has one user" do
  	assert_respond_to Track.new, :user
  end

  test "is not created when there is no name" do
  	assert_difference('Track.count', 0) do
  	  Track.create(:description => "test", :level => 3, :timer => 3)
  	end
  end
end
