# frozen_string_literal: true

class User < ApplicationRecord
  has_secure_password

  has_many :contacts
  has_many :documents
  has_many :jobs
  has_many :tasks

  validates :username, :password, :email, presence: true
  validates :username, uniqueness: true
  validates :email, format: { with: URI::MailTo::EMAIL_REGEXP }
  validates :email, uniqueness: true
  validates :password, length: { in: 3..20 }
end
