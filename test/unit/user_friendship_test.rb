require 'test_helper'

class UserFriendshipTest < ActiveSupport::TestCase
  should belong_to(:user)
  shoud belong_to(:friend)

  test "that creating a friendship works without raising an exception" do
  	assert_nothing_raised do
  	   UserFriendship.create user: users(:lowell), friend: users(:mike)
    end
  end

test "that creating a friendship based on user id and friend id works" do
    UserFriendship.create user_id: users(:lowell).id, friend_id: users(:mike).id
       assert users(:lowell).friends.include?(users(:mike))
  end
end