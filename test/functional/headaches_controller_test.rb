require 'test_helper'

class HeadachesControllerTest < ActionController::TestCase
  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:headaches)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create headach" do
    assert_difference('Headach.count') do
      post :create, :headach => { }
    end

    assert_redirected_to headach_path(assigns(:headach))
  end

  test "should show headach" do
    get :show, :id => headaches(:one).to_param
    assert_response :success
  end

  test "should get edit" do
    get :edit, :id => headaches(:one).to_param
    assert_response :success
  end

  test "should update headach" do
    put :update, :id => headaches(:one).to_param, :headach => { }
    assert_redirected_to headach_path(assigns(:headach))
  end

  test "should destroy headach" do
    assert_difference('Headach.count', -1) do
      delete :destroy, :id => headaches(:one).to_param
    end

    assert_redirected_to headaches_path
  end
end
