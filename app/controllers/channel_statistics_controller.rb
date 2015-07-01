class ChannelStatisticsController < ApplicationController
  before_action :set_channel_statistic, only: [:show, :edit, :update, :destroy]

  # GET /channel_statistics
  # GET /channel_statistics.json
  def index
    @channel_statistics = ChannelStatistic.all
  end

  # GET /channel_statistics/1
  # GET /channel_statistics/1.json
  def show
  end

  # GET /channel_statistics/new
  def new
    @channel_statistic = ChannelStatistic.new
  end

  # GET /channel_statistics/1/edit
  def edit
  end

  # POST /channel_statistics
  # POST /channel_statistics.json
  def create
    @channel_statistic = ChannelStatistic.new(channel_statistic_params)

    respond_to do |format|
      if @channel_statistic.save
        format.html { redirect_to @channel_statistic, notice: 'Channel statistic was successfully created.' }
        format.json { render :show, status: :created, location: @channel_statistic }
      else
        format.html { render :new }
        format.json { render json: @channel_statistic.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /channel_statistics/1
  # PATCH/PUT /channel_statistics/1.json
  def update
    respond_to do |format|
      if @channel_statistic.update(channel_statistic_params)
        format.html { redirect_to @channel_statistic, notice: 'Channel statistic was successfully updated.' }
        format.json { render :show, status: :ok, location: @channel_statistic }
      else
        format.html { render :edit }
        format.json { render json: @channel_statistic.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /channel_statistics/1
  # DELETE /channel_statistics/1.json
  def destroy
    @channel_statistic.destroy
    respond_to do |format|
      format.html { redirect_to channel_statistics_url, notice: 'Channel statistic was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_channel_statistic
      @channel_statistic = ChannelStatistic.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def channel_statistic_params
      params.require(:channel_statistic).permit(:channel_id, :video_count, :view_count, :comment_count, :subscriber_count)
    end
end
