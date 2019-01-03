# frozen_string_literal: true

class TaskSerializer < ActiveModel::Serializer
  attributes :id, :title, :description, :due_date, :completed
  belongs_to :user
  has_many :jobs
  has_many :contacts
  has_many :documents
end
