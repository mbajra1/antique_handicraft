class CatalogController < ApplicationController
  def index
    #@catalogs = Product.order(:product_name)


    prod_cat1='Artifact'
    prod_cat2='Jewellery'
    prod_cat3='Thangka'

    @thangkas = Product.where("category= '#{prod_cat3}'")
    @artifacts = Product.where("category= '#{prod_cat1}'")
    @jewelleries = Product.where("category= '#{prod_cat2}'")


  end
end
