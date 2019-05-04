# frozen_string_literal: true

class Task < ApplicationRecord
  belongs_to :user

  has_many :company_tasks
  has_many :companies, through: :company_tasks

  has_many :task_contacts
  has_many :contacts, through: :task_contacts

  has_many :task_documents
  has_many :documents, through: :task_documents
  
  has_many :task_jobs
  has_many :jobs, through: :task_jobs

  validates :title, presence: true
  validates_associated :user

  scope :completed_false, -> { where('completed = ?', false) }
  scope :completed_true, -> { where('completed = ?', true) }

  scope :overdue, -> { where('due_date < ?', DateTime.now.end_of_day) }
  scope :upcoming, -> { where('due_date >= ?', DateTime.now.beginning_of_day) }
  scope :today, -> { where(created_at: DateTime.now.beginning_of_day..DateTime.now.end_of_day) }
end
