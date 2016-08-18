class CategoryController < ApplicationController

  def show
    @categories=Category.all
  end
  def edit
    @categories=Category.find_by(name: 'David')
    @categories.name = 'Dave'
    @categories.save
  end
end
