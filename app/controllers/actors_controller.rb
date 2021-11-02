class ActorsController < ApplicationController
  def index
    @actor = Actor.all
  end

  def show
    @actor = Actor.find(params[:id])
  end

  def create
    @actor = Actor.new(actor_params)
  end

  def update
    @actor = Actor.find(actor_params)

    redirect_to '/movies/#{movie.id}'
  end

  private

  def actor_params
    params.permit(:id, :name, :age)
  end
end