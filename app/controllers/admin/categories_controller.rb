class Admin::CategoriesController < ApplicationController

  def index
    @category = Category.all

  end

  def new
    @category = Category.new
  end

  def create

  end

end
