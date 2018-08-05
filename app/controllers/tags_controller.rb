class TagsController < ApplicationController
  before_action :find_root_tags

  def index
  end

  def show
    @tag = Category.includes(articles: [:user, { comments: :user }]).find(params[:id])
    @articles = @tag.articles.where(status: true).page(params[:page])
  end

  private
    def find_root_tags
      @root_tags = Category.includes(:subordinates).roots.order(weight: "desc")
    end
end
