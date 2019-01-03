# frozen_string_literal: true

class Contact < ApplicationRecord
  belongs_to :user
  has_many :job_contacts
  has_many :jobs, through: :job_contacts

  has_many :task_contacts
  has_many :tasks, through: :task_contacts

  scope :is_reference, -> { where('reference = ?', true) }

  validates :email, :first_name, presence: true
  validates_associated :user

  def full_name
    "#{first_name} #{last_name}"
  end
end
