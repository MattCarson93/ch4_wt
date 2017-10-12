class MoviesController < ApplicationController
    def index
        @movies = Movie.all
    end
    
    def show
      id = params[:id] # retrieve movie ID from URI route
      @movie = Movie.find(id) # lookup movie by id
      # will render app/views/movies/show.html.haml by default
    end
    
    def new
      @movie = Movie.new
    end
    
    def create
      @movie = Movie.create!(movie_params)
      flash[:notice] = "#{@movie.title} was successfully created."
      redirect_to movies_path
    end
    # add below all other methods
private

  def movie_params
    params.require(:movie).permit(:title, :rating, :description, :release_date)
  end
end
