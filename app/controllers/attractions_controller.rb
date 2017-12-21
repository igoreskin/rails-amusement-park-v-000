class AttractionsController < ApplicationController

  def index
    @attractions = Attraction.all
    set_user
  end

  def show
    set_attraction
    set_user
  end

  def new
    @attraction = Attraction.new
  end

  def create
    @attraction = Attraction.new(attraction_params)
    if @attraction.save
      redirect_to attraction_path(@attraction)
    end
  end

  def edit
    set_attraction
  end

  def update
    set_attraction
    @attraction.update(attraction_params)
    redirect_to attraction_path(@attraction)
  end

  private

  def attraction_params
    params.require(:attraction).permit(:name, :min_height, :happiness_rating, :nausea_rating, :tickets)
  end

  def set_user
    @user = User.find_by(id: session[:user_id])
  end

  def set_attraction
    @attraction = Attraction.find(params[:id])
  end

end
