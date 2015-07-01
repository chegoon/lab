require 'test_helper'

class ChannelStatisticsControllerTest < ActionController::TestCase
  setup do
    @channel_statistic = channel_statistics(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:channel_statistics)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create channel_statistic" do
    assert_difference('ChannelStatistic.count') do
      post :create, channel_statistic: { channel_id: @channel_statistic.channel_id, comment_count: @channel_statistic.comment_count, subscriber_count: @channel_statistic.subscriber_count, video_count: @channel_statistic.video_count, view_count: @channel_statistic.view_count }
    end

    assert_redirected_to channel_statistic_path(assigns(:channel_statistic))
  end

  test "should show channel_statistic" do
    get :show, id: @channel_statistic
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @channel_statistic
    assert_response :success
  end

  test "should update channel_statistic" do
    patch :update, id: @channel_statistic, channel_statistic: { channel_id: @channel_statistic.channel_id, comment_count: @channel_statistic.comment_count, subscriber_count: @channel_statistic.subscriber_count, video_count: @channel_statistic.video_count, view_count: @channel_statistic.view_count }
    assert_redirected_to channel_statistic_path(assigns(:channel_statistic))
  end

  test "should destroy channel_statistic" do
    assert_difference('ChannelStatistic.count', -1) do
      delete :destroy, id: @channel_statistic
    end

    assert_redirected_to channel_statistics_path
  end
end
