class Admin::MoviesController < ApplicationController
  before_action :set_movie, only: [:edit, :update, :show]
  def index
    @movies = Movie.all
  end
  def new
    @movie = Movie.new
  end

  def show
  end

  def create
    @movie = Movie.new(movie_params)
    if @movie.save
      redirect_to admin_movies_path(@movie)
    else
      render :new
    end
  end
  def update
    if @movie.update(movie_params)
      redirect_to admin_movie_path(@movie), notice: 'Movie was successfully updated.'
    else
      render :edit
    end
  end

  private

  def set_movie
    @movie = Movie.find(params[:id])
  end

  def movie_params
    params.require(:movie).permit(:name, :year, :description, :image_url, :is_showing)
  end
end
