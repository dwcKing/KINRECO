class Admins::GenresController < ApplicationController

  def new
  	@genre=Genre.new
  end




    def create
         genre = Genre.new(genre_params)
         genre.save
         redirect_to admins_genres_path
    end

    def index
    	@genres = Genre.page(params[:page]).per(2)
    end


    def edit
        @genre = Genre.find(params[:id])
    end

     def update
        genre= Genre.find(params[:id])
        genre.update(genre_params)
        redirect_to admins_genres_path(genre.id)
    end

    def destroy
    	  @genre= Genre.find(params[:id])
        @genre.destroy
        redirect_to admins_genres_path
    end


 private
    def genre_params
        params.require(:genre).permit(:genre_name)
    end
end