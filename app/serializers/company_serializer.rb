# frozen_string_literal: true

class CompanySerializer < ActiveModel::Serializer
  attributes :id, :name, :website
  belongs_to :user

  has_many :company_documents 
  has_many :documents

  has_many :company_contacts 
  has_many :contacts

  has_many :company_tasks
  has_many :tasks
end
