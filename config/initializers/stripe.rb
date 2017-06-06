if Rails.env.production?
  Rails.configuration.stripe = {
    publishable_key: ENV['STRIPE_PUBLISHABLE_KEY'],
    secret_key: ENV['STRIPE_SECRET_KEY']
  }
else
  Rails.configuration.stripe = {
    publishable_key: 'pk_test_4xdm1aCRusgu3VHInzZDuVtI',
    secret_key: 'sk_test_v0fE944tiTYI7E8o2ipljKg4'
  }
end

Stripe.api_key = Rails.configuration.stripe[:secret_key]