require 'test_helper'

class PlaylistItemsControllerTest < ActionController::TestCase
  setup do
    @playlist_item = playlist_items(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:playlist_items)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create playlist_item" do
    assert_difference('PlaylistItem.count') do
      post :create, playlist_item: { description: @playlist_item.description, it_id: @playlist_item.it_id, playlist_id: @playlist_item.playlist_id, position: @playlist_item.position, published_at: @playlist_item.published_at, thumbnail_url: @playlist_item.thumbnail_url, title: @playlist_item.title, video_id: @playlist_item.video_id }
    end

    assert_redirected_to playlist_item_path(assigns(:playlist_item))
  end

  test "should show playlist_item" do
    get :show, id: @playlist_item
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @playlist_item
    assert_response :success
  end

  test "should update playlist_item" do
    patch :update, id: @playlist_item, playlist_item: { description: @playlist_item.description, it_id: @playlist_item.it_id, playlist_id: @playlist_item.playlist_id, position: @playlist_item.position, published_at: @playlist_item.published_at, thumbnail_url: @playlist_item.thumbnail_url, title: @playlist_item.title, video_id: @playlist_item.video_id }
    assert_redirected_to playlist_item_path(assigns(:playlist_item))
  end

  test "should destroy playlist_item" do
    assert_difference('PlaylistItem.count', -1) do
      delete :destroy, id: @playlist_item
    end

    assert_redirected_to playlist_items_path
  end
end
