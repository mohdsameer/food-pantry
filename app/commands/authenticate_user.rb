class AuthenticateUser
  prepend SimpleCommand

  def initialize(email, password)
    @email = email
    @password = password
  end

  def call
    JsonWebToken.encode(user_id: user.id) if user
  end

  private

  attr_accessor :email, :password

  def user
    user = User.find_by(email:)
    if user.present?
      if user.confirmed?
        user
      else
        errors.add :user_authentication, 'Unconfirmed email'
        nil
      end
    else
      errors.add :user_authentication, 'Please enter a correct email address'
      nil
    end
  end
end
