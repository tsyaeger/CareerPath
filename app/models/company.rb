class Company < ApplicationRecord
  belongs_to :user

  has_many :company_jobs
  has_many :jobs, through: :company_jobs

  has_many :company_contacts
  has_many :contacts, through: :company_contacts

  has_many :company_documents
  has_many :documents, through: :company_documents
  
  has_many :company_tasks
  has_many :tasks, through: :company_tasks

  validates_associated :user

  # def next
  #   join_query = 'LEFT OUTER JOIN users ON user_id = users.id'
  #   where_query = 'jobs.id > ? AND jobs.user_id = ?'

  #   job = Job.joins(join_query).where(where_query, id, user_id).first
  #   job ||= Job.find_by(user_id: user_id)
  # end

  # def previous
  #   join_query = 'LEFT OUTER JOIN users ON user_id = users.id'
  #   where_query = 'jobs.id > ? AND jobs.user_id = ?'

  #   job = Job.joins(join_query).where(where_query, id, user_id).first
  #   job ||= Job.find_by(user_id: user_id)
  # end

end
