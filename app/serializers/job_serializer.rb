# frozen_string_literal: true

class JobSerializer < ActiveModel::Serializer
  attributes :id, :company, :position, :url, :date_posted, :closing_date, :job_desc, :co_desc, :requirements, :notes, :applied
  belongs_to :user

  has_many :job_documents 
  has_many :documents

  has_many :job_contacts 
  has_many :contacts

  has_many :task_jobs
  has_many :tasks
end
