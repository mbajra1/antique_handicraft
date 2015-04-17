class CatalogController < ApplicationController
  def index
    #@catalogs = Product.order(:product_name)

    if(params[:notice]!=nil)

      flash[:notice]="Thank you for your business. Your transaction has been successfully completed"

    end

    prod_cat1='Artifact'
    prod_cat2='Jewellery'
    prod_cat3='Thangka'

    @thangkas = Product.where("category= '#{prod_cat3}'")
    @artifacts = Product.where("category= '#{prod_cat1}'")
    @jewelleries = Product.where("category= '#{prod_cat2}'")

    #get the shopping cart for the user
    @shopping_cart= session[:cart_id]


    #get cart_items associated with the shopping cart
    @check_cart_items=CartItem.where(shopping_cart_id: session[:cart_id])

    #get count of unique items(does not consider each quantity ) in shopping cart
    @cart_item_count= CartItem.distinct.count('product_id')


    #get sub total of the items in shopping cart
    @check_cart_items.each do |item|
      item_total=item.total_price
      @cart_sub_total=@check_cart_items.to_a.sum { |item| item.total_price }
    end


  end
end
