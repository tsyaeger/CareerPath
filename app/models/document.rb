# frozen_string_literal: true

class Document < ApplicationRecord
  belongs_to :user

  has_many :job_documents
  has_many :jobs, through: :job_documents

  has_many :task_documents
  has_many :tasks, through: :task_documents

  scope :filtered_document, ->(substring) { where('title LIKE ? ', "%#{substring}%") }
end
