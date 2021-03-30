class GifsController < ApplicationController
  def index
    @gif = Gif.new
  end

  def create
    @gif = Gif.create(gif_params)

    # if @gif.save
    #   add message to the flash "Success. your file has been added."
    #   redirecting to index
    # else
    #   add message to flash "Your file could not be added"
    #   re render index

    if @gif.save
      flash[:message] = "Success. Your file has been added"
      redirect_to gifs_path
    end

  end

  private

  def gif_params
    params.require(:gif).permit(:file)
  end
end
