class GifsController < ApplicationController
  def index
    @gifs = Gif.paginate(page: params[:page], per_page: 5)
  end

  def create
    @gif = Gif.create(gif_params)

    if @gif.save
      flash[:message] = "Success. Your file has been added"
      redirect_to gifs_path
    end
  end

  def show
    @gif = Gif.find(params[:id])
  end

  private

  def gif_params
    params.permit(:file)
  end
end
