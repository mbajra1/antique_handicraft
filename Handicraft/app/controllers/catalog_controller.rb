class CatalogController < ApplicationController
  def index
    #display product according to the category
    @product = Product.all
    category=params[:category]
    search=params[:search]
    
    if category == "All"
      @product = Product.all
      
    elsif search
      @product = Product.search(search)   # For search result
    end
      
    else
      @product = Product.where("category= '#{category}'") # For search category
    end
  
    # Cart transaction
    if(params[:transaction]=='successful')
      flash[:notice]="Thank you for your business. Your transaction has been successfully completed"
    end

    prod_id =params[:id]
    
    @added_item=Product.where("product_id='#{prod_id}'")

    @added_item.each do |added|
      @prim_product_id=added.id
    end

    #get the shopping cart for the user
    @shopping_cart= session[:cart_id]

    #get cart_items associated with the shopping cart
    @check_cart_items=CartItem.where(shopping_cart_id: session[:cart_id])

    @recent_item=CartItem.where(product_id:  @prim_product_id)

    @recent_item.each do |recent|
      @cart_quantity=recent.quantity
    end

    #get count of unique items(does not consider each quantity ) in shopping cart
    @cart_item_count= CartItem.distinct.count('product_id')

    #get sub total of the items in shopping cart
    @check_cart_items.each do |item|
      item_total=item.total_price
      @cart_sub_total=@check_cart_items.to_a.sum { |item| item.total_price }
    end
  end
end
