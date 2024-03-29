require 'test_helper'

class ProfilesControllerTest < ActionController::TestCase
  test "should get show" do
    get :show, id: users(:lowell).profile_name
    assert_response :success
    assert_template 'profiles/show'
  end

  test "should render a 404 on profile not found" do
  	get :show, id: "doesn't exist"
  	assert_response :not_fouund
  end

  test "that variable are assigned on successful profile viewing" do
  	get :show, id: users(:lowell).profile_name
  	assert assigns(:user)
  	assert_not_empty assigns(:statuses)
   end 

   test "only show the correct user's statuses" do
   	get :show, id: users(:lowell).profile_name
   	assigns(:statuses).each do |status|
   		assert_equal users(:lowell), status.user
   end

   test "only shows the corect user's statuses" do
    get :show, id: users(:lowell).profile_name
    assigns(:statuses).each do |status|
      assert_equal users(:lowell), status.user
    end
  end
end
end