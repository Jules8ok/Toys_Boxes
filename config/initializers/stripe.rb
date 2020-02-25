

Rails.configuration.stripe = {
  # ...
  :publishable_key => Figaro.env.stripe_publishable_key,
  :secret_key =>      Figaro.env.stripe_api_key,
  :signing_secret =>  Figaro.env.stripe_webhook_secret_key

}

Stripe.api_key = Rails.configuration.stripe[:secret_key]

# ...

StripeEvent.signing_secret = Rails.configuration.stripe[:signing_secret]

StripeEvent.configure do |events|
  events.subscribe 'checkout.session.completed', StripeCheckoutSessionService.new
end


