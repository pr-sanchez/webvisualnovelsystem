require 'test_helper'

class NovelsControllerTest < ActionController::TestCase
  setup do
    @novel = novels(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:novels)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create novel" do
    assert_difference('Novel.count') do
      post :create, novel: { description: @novel.description, title: @novel.title }
    end

    assert_redirected_to novel_path(assigns(:novel))
  end

  test "should show novel" do
    get :show, id: @novel
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @novel
    assert_response :success
  end

  test "should update novel" do
    patch :update, id: @novel, novel: { description: @novel.description, title: @novel.title }
    assert_redirected_to novel_path(assigns(:novel))
  end

  test "should destroy novel" do
    assert_difference('Novel.count', -1) do
      delete :destroy, id: @novel
    end

    assert_redirected_to novels_path
  end
end
