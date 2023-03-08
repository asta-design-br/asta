class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  validates :full_name, :username, :email, :profile, presence: true
  validates :full_name, length: { minimum: 2, message: "Need name and surname" }
  validates :username, :username_cannot_have_space_or_accent
  validates :email, format: { with: URI::MailTo::EMAIL_REGEXP }


  validate :expiration_date_cannot_be_in_the_past,
  :discount_cannot_be_greater_than_total_value

  def username_cannot_have_space_or_accent
    special = "?<>',?[]}{=-)(*&^%$#`~{}"
    regex = /[#{special.gsub(/./){|char|"\\#{char}"}}]/
    if username.match(" ") || username =~ regex
      errors.add(:expiration_date, "can't be in the past")
    end
  end


end
