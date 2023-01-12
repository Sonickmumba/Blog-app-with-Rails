class JsonWebToken
  JWT_SECRET_KEY = ENV.fetch('JWT_SECRET_KEY', nil)

  def self.encode(payload)
    JWT.encode(payload, JWT_SECRET_KEY)
  end

  def self.decode(token)
    body = JWT.decode(token, JWT_SECRET_KEY)[0]
    HashWithIndifferentAccess.new body
  end
end
