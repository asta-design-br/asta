require "cpf_cnpj"

class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  validates :username, :profile, presence: true
  validate :check_full_name
  # validate :check_username
  # validates :email, format: { with: URI::MailTo::EMAIL_REGEXP }
  # validates :profile ??
  # validates :document, :check_document

  def check_full_name
    regex = /^([a-zA-Z])+(\s([a-zA-Z])+)+$/
    p full_name.strip =~ regex
    return if full_name.strip =~ regex

    errors.add(
      :full_name,
      "Should contain a name and surname."
    )
  end

  # def check_username
  #   regex = /^([a-z]|_)+$/
  #   return if username.strip =~ regex

  #   errors.add(
  #     :username,
  #     "Should contain downcase letters and underscore."
  #   )
  # end

  # def check_document
  #   return if CPF.valid?(:document)

  #   errors.add(
  #     :document,
  #     "Should be a CPF or CNPJ valid number."
  #   )
  # end
end
