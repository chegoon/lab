class VideosController < ApplicationController
  before_action :set_video, only: [:show, :edit, :update, :destroy]
  #before_action :authenticate_user!

  helper_method :sort_column, :sort_direction
  # GET /videos
  # GET /videos.json
  def index
    #@videos = Video.order("published_at DESC").page(params[:page])
    @videos = Video.order(sort_column + ' ' + sort_direction).page(params[:page])
    #@videos = Video.order(params[:sort]).page(params[:page])
  end

  # GET /videos/1
  # GET /videos/1.json
  def show
    @video_stats = @video.video_statistics
    @ch_stats = @video.channel.channel_statistics
    @re_stats = @video.channel.regions.first.region_statistics
    @re_videos = Video.where("channel_id IN (?)", @video.channel.regions.first.channels.map(&:id))
=begin    
    @re_videos = Array.new
    @video.channel.regions.first.channels.each do |ch|
      ch.videos.each do |v|
        @re_videos.push(v)
      end
    end
=end    
  end

  # GET /videos/new
  def new
    @video = Video.new
  end

  # GET /videos/1/edit
  def edit
  end

  # POST /videos
  # POST /videos.json
  def create
    @video = Video.new(video_params)

    respond_to do |format|
      if @video.save
        format.html { redirect_to @video, notice: 'Video was successfully created.' }
        format.json { render :show, status: :created, location: @video }
      else
        format.html { render :new }
        format.json { render json: @video.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /videos/1
  # PATCH/PUT /videos/1.json
  def update
    respond_to do |format|
      if @video.update(video_params)
        format.html { redirect_to @video, notice: 'Video was successfully updated.' }
        format.json { render :show, status: :ok, location: @video }
      else
        format.html { render :edit }
        format.json { render json: @video.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /videos/1
  # DELETE /videos/1.json
  def destroy
    @video.destroy
    respond_to do |format|
      format.html { redirect_to videos_url, notice: 'Video was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_video
      @video = Video.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def video_params
      params.require(:video).permit(:v_id, :title, :description, :published_at, :thumbnail_url, :channel_id)
    end
  def sort_direction
    %w[asc desc].include?(params[:direction]) ?  params[:direction] : "desc"
  end
  def sort_column
    Video.column_names.include?(params[:sort]) ? params[:sort] : "published_at"
  end
end
