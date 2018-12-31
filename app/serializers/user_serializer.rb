# frozen_string_literal: true

class UserSerializer < ActiveModel::Serializer
  attributes :id, :email
  has_many :contacts
  has_many :jobs
  has_many :documents
  has_many :tasks
end
