Rails.application.config.middleware.use OmniAuth::Builder do
  provider :facebook, ENV['200891760492185'], ENV['FACEBOOK_SECRET']
end
