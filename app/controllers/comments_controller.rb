class CommentsController < ApplicationController
  before_action :logged_in_user

  def create
    @article = Article.find(params[:id])
    @comment = @article.comments.build(comment_params)
    @comment.user_id = current_user.id
    if @comment.save
      flash[:success] = "评论成功!"
      redirect_to article_path(@article, anchor: "comment_#{@comment.id}")
    else
      flash[:danger] = "评论不能为空!"
      redirect_to article_path(@article)
    end
  end

  def edit
    @comment = Comment.find(params[:id])
  end

  def update
    @comment = Comment.find(params[:id])
    if @comment.update_attributes(params.require(:comment).permit!)
      @article = Article.find(params[:article])
      redirect_to article_path(@article)
    else
      render 'edit'
    end
  end

  def destroy
    @comment = Comment.find(params[:id])
    @comment.destroy
    @article = Article.friendly.find(params[:article])
    redirect_to article_path(@article)
  end

  private
    def comment_params
      params.require(:comment).permit(:content)
    end
end
