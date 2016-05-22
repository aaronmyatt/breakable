class MapsController < ApplicationController
  before_action :set_map, only: [:show, :edit, :update, :destroy]
  skip_before_action :verify_authenticity_token


  # GET /maps
  # GET /maps.json
  def index
    @point  = Point.where(profile_id: current_profile.id)
    @hash = Gmaps4rails.build_markers(@point) do |point, marker|
      marker.lat point.lat
      marker.lng point.lng
    end
  end

  # POST /maps
  # POST /maps.json
  def create
    
    point = Point.new(map_params)
    point.profile_id = current_profile.id
    
    respond_to do |format|
      if point.save
        format.html { redirect_to :index, notice: 'Point was successfully created.' }
        format.json { render :index, status: :created, location: @map }
      else
        format.html { render :index }
        format.json { render json: @map.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /maps/1
  # DELETE /maps/1.json
  def destroy
    respond_to do |format|
      format.html { redirect_to maps_url, notice: 'Map was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_map
      # @map = Map.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def map_params
      params.require(:point).permit(:lat, :lng)
    end
end
