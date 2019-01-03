# frozen_string_literal: true

class Document < ApplicationRecord
  belongs_to :user

  has_many :job_documents
  has_many :jobs, through: :job_documents

  has_many :task_documents
  has_many :tasks, through: :task_documents

  validates :title, presence: true
  validates_associated :user
end
