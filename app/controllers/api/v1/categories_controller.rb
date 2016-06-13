class Api::V1::CategoriesController < ApplicationController

  def index
    @categories = Category.all.order(:id)
  end

  def update
    category = Category.find_by(id: params[:id])
    category.update(mechanism: params[:mechanism])
    render json: {message: "Category updated"}
  end

  def destroy
    category = Category.find_by(id: params[:id])
    category.delete
    render json: {message: "Category deleted"}
  end

end
