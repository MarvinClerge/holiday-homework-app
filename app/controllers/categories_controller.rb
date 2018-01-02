class CategoriesController < ApplicationController
  def index
    @categories = Category.take(3)
  end
end
