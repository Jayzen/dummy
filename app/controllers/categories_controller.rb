class CategoriesController < ApplicationController
  before_action :find_root_categories, only: [:new, :create, :edit, :update]
  before_action :find_category, only: [:edit, :update, :destroy]
  before_action :logged_in_user
  before_action :admin_user

  def index
    if params[:id].blank?
      @categories = Category.roots
    else
      @category = Category.includes(:subordinates).find(params[:id])
      @categories = @category.children
    end

    @categories = @categories.order(id: "desc").page(params[:page])
  end

  def new
    @category = Category.new
  end

  def create
    @category = Category.new(params.require(:category).permit!)

    if @category.save
      flash[:success] = "保存成功"
      redirect_to categories_path
    else
      render action: :new
    end
  end

  def edit
    render action: :new
  end

  def update
    @category.attributes = params.require(:category).permit!

    if @category.save
      flash[:success] = "修改成功"
      redirect_to categories_path
    else
      render action: :new
    end
  end

  def destroy
    if @category.destroy
      flash[:success] = "删除成功"
      redirect_to categories_path
    else
      flash[:danger] = "删除失败"
      redirect_to :back
    end
  end

  private
    def find_root_categories
      @root_categories = Category.roots.order(id: "desc")
    end

    def find_category
      @category = Category.find(params[:id])
    end
end
