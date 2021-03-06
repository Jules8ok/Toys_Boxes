class OrdersController < ApplicationController

  def create
    Stripe.api_key = Figaro.env.stripe_api_key
    product = Product.find(params[:product_id])
    order  = Order.create!(product: product, product_sku: product.sku, amount: product.price, state: 'pending', user: current_user)
    session = Stripe::Checkout::Session.create(


      payment_method_types: ['card'],
      line_items: [{
        name: product.sku,
        images: [product.photo_url],
        amount: product.price_cents,
        currency: 'eur',
        quantity: 1
      }],
      success_url: order_url(order),
      cancel_url: order_url(order)
      )

    order.update(checkout_session_id: session.id)
    redirect_to new_order_payment_path(order)

  end


  def show
    @order = current_user.orders.find(params[:id])
  end

  def index
    @orders = current_user.orders.all
  end

end



