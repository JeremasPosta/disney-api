class JsonWebToken
  class << self
    def encode(payload, exp = 24.hours.from_now)
      payload[:exp] = exp.to_i
      puts Rails.application.secrets.secret_key_base.to_s
      JWT.encode(payload, Rails.application.secrets.secret_key_base)
    end
 
    def decode(token)
      puts Rails.application.secrets.secret_key_base.to_s
      body = JWT.decode(token, Rails.application.secrets.secret_key_base)[0]
      HashWithIndifferentAccess.new body
    end
  end
 end