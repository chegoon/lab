class ChannelsController < ApplicationController
  include HTTParty

  before_action :set_channel, only: [:show, :edit, :update, :destroy]
  #before_action :authenticate_user!

  helper_method :sort_column, :sort_direction
  # GET /channels
  # GET /channels.json
  def index
    #@channels = Channel.order("subscriber_count DESC").page(params[:page])
    @channels = Channel.order(sort_column + ' ' + sort_direction).page(params[:page])
    if params[:update_all] == 'true' 
      ChannelsWorker.perform_async
    end
  end

  # GET /channels/1
  # GET /channels/1.json
  def show
    @channel_stats = @channel.channel_statistics
    @playlists = @channel.playlists
    @videos = @channel.videos
  end

  # GET /channels/new
  def new
    @channel = Channel.new
  end

  # GET /channels/1/edit
  def edit
  end

  # POST /channels
  # POST /channels.json
  def create
    if channel_params.permit(:ch_id)
      response = HTTParty.get("https://www.googleapis.com/youtube/v3/channels?key=AIzaSyCZT4tgs-exq5My9CaiMmf4N6rQ2WFNzIA&forUsername=kyungsunxoxo&part=id")
      puts response.body, response.code, response.message, response.headers.inspect

=begin      
      url = URI.parse("https://www.googleapis.com/youtube/v3/channels?key=AIzaSyCZT4tgs-exq5My9CaiMmf4N6rQ2WFNzIA&forUsername=kyungsunxoxo&part=id")
      req = Net::HTTP::Get.new(url.to_s)
      res = Net::HTTP.start(url.host, url.port) {|http|
        http.request(req)
      }
      puts res.body
=end      
    end
    @channel = Channel.new(channel_params)

    respond_to do |format|
      if @channel.save
        ChannelsWorker.perform_async(@channel.id)
        
        format.html { redirect_to @channel, notice: 'Channel was successfully created.' }
        format.json { render :show, status: :created, location: @channel }
      else
        format.html { render :new }
        format.json { render json: @channel.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /channels/1
  # PATCH/PUT /channels/1.json
  def update
    respond_to do |format|
      if @channel.update(channel_params)
        
        ch = Yt::Channel.new id: @channel.ch_id
        @channel.channel_statistics.create(video_count: ch.video_count, view_count: ch.view_count, comment_count: ch.comment_count, subscriber_count: ch.subscriber_count)

        pls = ch.playlists
        if pls
          pls.each do |pl|
            ch_pl = @channel.playlists.find_or_create_by(pl_id: pl.id)
            ch_pl.update(title: pl.title, description: pl.description, thumbnail_url: pl.thumbnail_url, tags: pl.tags, published_at: pl.published_at)
          end
        end

        format.html { redirect_to @channel, notice: 'Channel was successfully updated.' }
        format.json { render :show, status: :ok, location: @channel }
      else
        format.html { render :edit }
        format.json { render json: @channel.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /channels/1
  # DELETE /channels/1.json
  def destroy
    @channel.destroy
    respond_to do |format|
      format.html { redirect_to channels_url, notice: 'Channel was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_channel
      @channel = Channel.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def channel_params
      params.require(:channel).permit(:ch_id, :title, :description, :published_at, :thumbnail_url, :video_count, :view_count, :subscriber_count, :comment_count, :joined)
    end
    def sort_direction
    %w[asc desc].include?(params[:direction]) ?  params[:direction] : "desc"
  end
  def sort_column
    Channel.column_names.include?(params[:sort]) ? params[:sort] : "subscriber_count"
  end
end
