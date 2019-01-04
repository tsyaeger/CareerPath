# frozen_string_literal: true

class DocumentSerializer < ActiveModel::Serializer
  attributes :id, :title, :url, :description, :doctype
  belongs_to :user

  has_many :job_documents
  has_many :jobs

  has_many :task_documents
  has_many :tasks
end
