class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

         validate :strong_password

  private
  def strong_password

    # At least one of each: Uppercase letter, lowercase, number.

    strong_password = /(?=.*\d)(?=.*[a-z])(?=.*[A-Z]).{8}/
    has_strong_password = strong_password.match?(password)

    unless has_strong_password
      errors.add(:password, 'is not strong enough')
    end
  end

end
