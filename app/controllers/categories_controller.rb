class CategoriesController < ApplicationController
  before_action :set_category, only: %i[show edit update destroy]
  before_action :authenticate_user!, except: :splash
  before_action :correct_user, only: %i[edit update destroy]

  def index
    @categories = Category.all
  end

  def show; end

  def new
    @category = current_user.categories.build
  end

  def edit; end

  def create
    @category = Category.new(category_params)
    # @category = current_user.categories.build(category_params)

    respond_to do |format|
      if @category.save
        format.html { redirect_to category_url(@category), notice: 'Category was successfully created.' }
      else
        format.html { render :new, status: :unprocessable_entity }
      end
    end
  end

  def update
    respond_to do |format|
      if @category.update(category_params)
        format.html { redirect_to category_url(@category), notice: 'Category was successfully updated.' }
      else
        format.html { render :edit, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @category.destroy

    respond_to do |format|
      format.html { redirect_to categories_url, notice: 'Category was successfully destroyed.' }
    end
  end

  def correct_user
    @category = current_user.categories.find_by(id: params[:id])
    redirect_to categories_path, notice: 'Not authorized user' if @category.nil?
  end

  private

  def set_category
    @category = Category.find(params[:id])
  end

  def category_params
    # params.require(:category).permit(:name, :icon, :transactions, :user_id)
    params.require(:category).permit(:name, :icon).merge(user_id: current_user.id)
  end
end
