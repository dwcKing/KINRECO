class Admins::GenresController < ApplicationController
  before_action :authenticate_admin!
  
    def create #ジャンル登録処理
         genre = Genre.new(genre_params)
         genre.save
         redirect_to admins_genres_path
    end

    def index #一覧
    	@genres = Genre.page(params[:page]).per(10)
    end

    def edit #編集
      @genre = Genre.find(params[:id])
    end

    def update #編集(処理)
      genre= Genre.find(params[:id])
      genre.update(genre_params)
      redirect_to admins_genres_path(genre.id)
    end

    def destroy #削除
    	@genre= Genre.find(params[:id])
      @genre.destroy
      redirect_to admins_genres_path
    end

 private
    def genre_params
      params.require(:genre).permit(:genre_name)
    end
end
