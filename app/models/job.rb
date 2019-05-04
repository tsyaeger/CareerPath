# frozen_string_literal: true

class Job < ApplicationRecord
  belongs_to :user

  has_many :company_jobs
  has_many :companies, through: :company_jobs
  
  has_many :job_contacts
  has_many :contacts, through: :job_contacts

  has_many :job_documents
  has_many :documents, through: :job_documents
  
  has_many :task_jobs
  has_many :tasks, through: :task_jobs

  validates :company, :position, presence: true
  validates_associated :user

  scope :applied, -> { where("applied = ? ", true) }


  def next
    join_query = 'LEFT OUTER JOIN users ON user_id = users.id'
    where_query = 'jobs.id > ? AND jobs.user_id = ?'

    job = Job.joins(join_query).where(where_query, id, user_id).first
    job ||= Job.find_by(user_id: user_id)
  end

  def previous
    join_query = 'LEFT OUTER JOIN users ON user_id = users.id'
    where_query = 'jobs.id > ? AND jobs.user_id = ?'

    job = Job.joins(join_query).where(where_query, id, user_id).first
    job ||= Job.find_by(user_id: user_id)
  end
end
