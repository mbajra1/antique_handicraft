class CatalogController < ApplicationController
  def index
    @product = Product.all

    category=params[:category]
    search=params[:search]
    if category == "All"
      @product = Product.all

    elsif search
      @product = Product.search(search)   # For search result

    else
      @product = Product.where("category= '#{category}'") # For search category
    end
  end
end
