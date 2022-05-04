class Admin::DashboardController < ApplicationController
  def show
    @products = Product.all
    @categories = Category.all.map do |category|
      {name: category.name, num_of_unique_plants: Product.where(category_id: category.id).count}
    end
    @plant_total = Product.count
    @category_total = Category.count
  end
end
