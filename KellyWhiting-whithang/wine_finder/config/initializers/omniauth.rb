OmniAuth.config.logger = Rails.logger

Rails.application.config.middleware.use OmniAuth::Builder do
  provider :facebook, '1626730020945328', '6ae43d5c984c4ee28be64ece84b4ae80', {:client_options => {:ssl => {:ca_file => Rails.root.join("cacert.pem").to_s}}}
  # provider :openid, :store => OpenID::Store::Filesystem.new('/tmp')
end