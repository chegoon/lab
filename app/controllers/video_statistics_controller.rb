class VideoStatisticsController < ApplicationController
  before_action :set_video_statistic, only: [:show, :edit, :update, :destroy]

  # GET /video_statistics
  # GET /video_statistics.json
  def index
    @video_statistics = VideoStatistic.all
  end

  # GET /video_statistics/1
  # GET /video_statistics/1.json
  def show
  end

  # GET /video_statistics/new
  def new
    @video_statistic = VideoStatistic.new
  end

  # GET /video_statistics/1/edit
  def edit
  end

  # POST /video_statistics
  # POST /video_statistics.json
  def create
    @video_statistic = VideoStatistic.new(video_statistic_params)

    respond_to do |format|
      if @video_statistic.save
        format.html { redirect_to @video_statistic, notice: 'Video statistic was successfully created.' }
        format.json { render :show, status: :created, location: @video_statistic }
      else
        format.html { render :new }
        format.json { render json: @video_statistic.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /video_statistics/1
  # PATCH/PUT /video_statistics/1.json
  def update
    respond_to do |format|
      if @video_statistic.update(video_statistic_params)
        format.html { redirect_to @video_statistic, notice: 'Video statistic was successfully updated.' }
        format.json { render :show, status: :ok, location: @video_statistic }
      else
        format.html { render :edit }
        format.json { render json: @video_statistic.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /video_statistics/1
  # DELETE /video_statistics/1.json
  def destroy
    @video_statistic.destroy
    respond_to do |format|
      format.html { redirect_to video_statistics_url, notice: 'Video statistic was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_video_statistic
      @video_statistic = VideoStatistic.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def video_statistic_params
      params.require(:video_statistic).permit(:video_id, :view_count, :like_count, :dislike_count, :favoirte_count, :comment_count)
    end
end
