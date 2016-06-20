class Api::V1::CategoriesController < ApplicationController

  def index
    @categories = Category.all.order(:id)
  end

  def update
    category = Category.find_by(id: params[:id])
    if category.update(mechanism: params[:mechanism])
      render json: {message: "Category updated!"}
    else
      render json: {errors: category.errors.full_messages}, status: 422
    end
  end

  def destroy
    category = Category.find_by(id: params[:id])
    if !category.nil?
      category.delete
      render json: {message: "Category deleted!"}
    else
      render json: {message: "Category not found."}
    end
  end

  def create
    category = Category.new(mechanism: params[:mechanism])
    if category.save
      render json: {message: "Category created!"}
    else
      render json: {errors: category.errors.full_messages}, status: 422
    end
  end

end
