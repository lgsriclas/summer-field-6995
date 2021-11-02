class MovieActorsController < ApplicationController
  def index
    @movie_actors = MovieActor.all
  end

  def create
    MovieActor.create!(movie: Movie.find(params[:movie]), actor: Actor.find(params[:actor]))
    redirect_to "/movies/#{params[:movie]}"
  end

  # def create
  #   MovieActor.create(movie_id: params[:id], actor_id: params[:actor_id])
  #   redirect_to "/movies/#{params[:id]}"
  # end
end