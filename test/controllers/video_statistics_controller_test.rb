require 'test_helper'

class VideoStatisticsControllerTest < ActionController::TestCase
  setup do
    @video_statistic = video_statistics(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:video_statistics)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create video_statistic" do
    assert_difference('VideoStatistic.count') do
      post :create, video_statistic: { comment_count: @video_statistic.comment_count, dislike_count: @video_statistic.dislike_count, favoirte_count: @video_statistic.favoirte_count, like_count: @video_statistic.like_count, video_id: @video_statistic.video_id, view_count: @video_statistic.view_count }
    end

    assert_redirected_to video_statistic_path(assigns(:video_statistic))
  end

  test "should show video_statistic" do
    get :show, id: @video_statistic
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @video_statistic
    assert_response :success
  end

  test "should update video_statistic" do
    patch :update, id: @video_statistic, video_statistic: { comment_count: @video_statistic.comment_count, dislike_count: @video_statistic.dislike_count, favoirte_count: @video_statistic.favoirte_count, like_count: @video_statistic.like_count, video_id: @video_statistic.video_id, view_count: @video_statistic.view_count }
    assert_redirected_to video_statistic_path(assigns(:video_statistic))
  end

  test "should destroy video_statistic" do
    assert_difference('VideoStatistic.count', -1) do
      delete :destroy, id: @video_statistic
    end

    assert_redirected_to video_statistics_path
  end
end
