# frozen_string_literal: true

class Session < ApplicationRecord
  validates :username, :password_digest, presence: true
end
