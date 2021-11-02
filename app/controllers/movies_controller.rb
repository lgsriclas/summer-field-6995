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

  private

  def movie_params
    params.permit(:id, :title, :creation_year, :genre)
  end
end