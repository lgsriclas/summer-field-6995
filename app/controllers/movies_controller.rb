class MoviesController < ApplicationController
  def index
    @movies = Movie.all
  end

  def show
    @movie = Movie.find(params[:id])
  end

  def create
    @movie = Movie.new(movie_params)
  end

  def update
    @movie = Movie.find(movie_params)

    redirect_to '/movies/#{movie.id}'
  end

  private

  def movie_params
    params.permit(:id, :title, :creation_year, :genre)
  end
end