require 'test_helper'

class BoardgamesControllerTest < ActionController::TestCase
  setup do
    @boardgame = boardgames(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:boardgames)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create boardgame" do
    assert_difference('Boardgame.count') do
      post :create, boardgame: { description: @boardgame.description, img: @boardgame.img, name: @boardgame.name }
    end

    assert_redirected_to boardgame_path(assigns(:boardgame))
  end

  test "should show boardgame" do
    get :show, id: @boardgame
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @boardgame
    assert_response :success
  end

  test "should update boardgame" do
    patch :update, id: @boardgame, boardgame: { description: @boardgame.description, img: @boardgame.img, name: @boardgame.name }
    assert_redirected_to boardgame_path(assigns(:boardgame))
  end

  test "should destroy boardgame" do
    assert_difference('Boardgame.count', -1) do
      delete :destroy, id: @boardgame
    end

    assert_redirected_to boardgames_path
  end
end
