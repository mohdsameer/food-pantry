class JsonWebToken
  class << self
    def encode(payload, exp = 24.years.from_now)
      payload[:exp] = exp.to_i
      JWT.encode(payload, Rails.application.secrets.secret_key_base || ENV['SECRET_KEY_BASE'])
    end

    def decode(token)
      body = JWT.decode(token, Rails.application.secrets.secret_key_base || ENV['SECRET_KEY_BASE'])[0]
      HashWithIndifferentAccess.new body
    rescue StandardError
      nil
    end
  end
end
