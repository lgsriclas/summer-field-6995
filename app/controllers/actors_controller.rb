class ActorsController < ApplicationController
  def index
    @actor = Actor.all
  end

  def show
    @actor = Actor.find(params[:id])
  end

  def create
    @actor = Actor.new(movie_params)
  end

  private

  def actor_params
    params.permit(:id, :name, :age)
  end
end