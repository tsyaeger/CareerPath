# frozen_string_literal: true

class Job < ApplicationRecord
  belongs_to :user
  
  has_many :job_contacts
  has_many :contacts, through: :job_contacts

  has_many :job_documents
  has_many :documents, through: :job_documents
  
  has_many :task_jobs
  has_many :tasks, through: :task_jobs

  scope :filtered_job, ->(substring) { where('company LIKE ? OR position LIKE ?', "%#{substring}%", "%#{substring}%") }
  scope :applied, -> { where("applied = ? ", true) }

  def full_name
    "#{first_name} #{last_name}"
  end


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
