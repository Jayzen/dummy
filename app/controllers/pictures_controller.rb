class PicturesController < ApplicationController
  def create
    picture = Picture.create! attach: params[:file]
    render json: { filename: picture.attach_url }
  end
end
