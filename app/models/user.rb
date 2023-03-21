class User < ApplicationRecord
  include Phonable

  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :addresses, as: :addressable

  validates :full_name, :username, presence: true
  validates :email, format: { with: URI::MailTo::EMAIL_REGEXP }
  validates :profile, length: { within: 30..500 }

  validate :check_full_name, :check_username, :check_document

  private

  def check_full_name
    regex = /^([a-zA-Z])+(\s([a-zA-Z])+)+$/
    return if full_name.nil? || full_name.strip =~ regex

    errors.add(
      :full_name,
      'should contain a name and surname.'
    )
  end

  def check_username
    regex = /^([a-z]|_)+$/
    return if username.nil? || username.strip =~ regex

    errors.add(
      :username,
      'should contain downcase letters and underscore.'
    )
  end

  def check_document
    return if document.nil? || CPF.valid?(document)

    errors.add(
      :document,
      'should be a CPF or CNPJ valid number.'
    )
  end
end
