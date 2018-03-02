class LikesController < ApplicationController
  before_action :logged_in_user

  def create
    @article = Article.find(params[:article_id])
    current_user.likes.create(article_id: params[:article_id])
    respond_to do |format|
      format.html { redirect_to article_path(@article) }
      format.js
    end
  end

  def destroy
    Like.find(params[:id]).destroy
    @article = Article.find(params[:article_id])
    respond_to do |format|
      format.html { redirect_to article_path(@article) }
      format.js
    end
  end
end
