class OrderItemsController < ApplicationController

  def create
    # find the product
    @product = Product.find(params[:product_id])

    # car = @current_cart

    # quantity
    @quantity = form_params[:quantity]

    @current_cart.order_items.create(product: @product, quantity: @quantity)

    # add  a flash message
    flash[:success] = "Thanks for adding to your cart"

    redirect_to product_path(@product)

  end


  def update
    @product = Product.find(params[:product_id])

    @order_item = OrderItem.find(params[:id])

    @order_item.update(form_params)

    flash[:success] = "Thats for updating your cart"

    redirect_to product_path(@product)

  end


  def destroy
    @product = Product.find(params[:product_id])
    @order_item = OrderItem.find(params[:id])

    @order_item.delete

    flash[:success] = "Product removed from cart"

    redirect_to cart_path
  end


  def form_params
    params.require(:order_item).permit(:quantity)
  end


end
