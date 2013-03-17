# == Schema Information
#
# Table name: users
#
#  id         :integer          not null, primary key
#  name       :string(255)
#  email      :string(255)
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

require 'test_helper'

class UserTest < ActiveSupport::TestCase
	test "has many tracks" do
		assert_respond_to User.new, :tracks
	end

	test "not being created when there is no name" do
		assert_difference('User.count', 0) do
		  User.create(email: "test@test.com")
		end
	end

	test "not being created when there is no email" do
		assert_difference('User.count', 0) do
		  User.create(name: "James")
		end
	end
end
