# frozen_string_literal: true

class TaskSerializer < ActiveModel::Serializer
  attributes :id, :title, :description, :due_date, :completed
  belongs_to :user

  has_many :task_contacts
  has_many :contacts

  has_many :task_documents
  has_many :documents
  
  has_many :task_jobs
  has_many :jobs
end
