class RegionsController < ApplicationController
  before_action :set_region, only: [:show, :edit, :update, :destroy]

  helper_method :sort_column, :sort_direction
  def index
    @regions = Region.all
    #respond_with(@regions)
  end

  def show
    #respond_with(@region)
    @channels = @region.channels.order(sort_column + ' ' + sort_direction).page(params[:page])
  end

  def new
    @region = Region.new
    #respond_with(@region)
  end

  def edit
  end

  def create
    @region = Region.new(region_params)
    @region.save
    #respond_with(@region)

    respond_to do |format|
      if @region.save
        
        format.html { redirect_to @region, notice: 'Region was successfully created.' }
        format.json { render :show, status: :created, location: @region }
      else
        format.html { render :new }
        format.json { render json: @region.errors, status: :unprocessable_entity }
      end
    end
  end

  def update
    @region.update(region_params)
    #respond_with(@region)
  end

  def destroy
    @region.destroy
    respond_to do |format|
      format.html { redirect_to regions_url, notice: 'Region was successfully destroyed.' }
      format.json { head :no_content }
    end
    #respond_with(@region)
  end

  private
    def set_region
      @region = Region.find(params[:id])
    end

    def region_params
      params.require(:region).permit(:code, :name)
    end
	def sort_direction
      %w[asc desc].include?(params[:direction]) ?  params[:direction] : "desc"
    end
    def sort_column
      Channel.column_names.include?(params[:sort]) ? params[:sort] : "subscriber_count"
    end
end
