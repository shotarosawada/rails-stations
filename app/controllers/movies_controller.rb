class MoviesController < ApplicationController
  def index
    @movies = Movie.all

    if params[:keyword].present?
      @movies = @movies.where("name LIKE ? OR description LIKE ?", "%#{params[:keyword]}%",  "%#{params[:keyword]}%")
    end

    if params[:is_showing] == "1"
      @movies = @movies.where(is_showing: true)
    elsif params[:is_showing] == "0"
      @movies = @movies.where(is_showing: false)
    end
  end

  def show
    # 指定されたIDの映画作品を取得
    @movie = Movie.includes(:schedules).find(params[:id])
    @schedules = @movie.schedules
  end
end
