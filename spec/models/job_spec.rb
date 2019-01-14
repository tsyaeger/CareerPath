# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Job, type: :model do
  describe 'associations' do
    it { should have_many(:job_documents) }
    it { should have_many(:documents).through(:job_documents) }
    it { should have_many(:job_contacts) }
    it { should have_many(:contacts).through(:job_contacts) }
    it { should have_many(:task_jobs) }
    it { should have_many(:tasks).through(:task_jobs) }
    it { should belong_to(:user) }
  end

  describe 'validations' do
    it { should validate_presence_of(:company) }
    it { should validate_presence_of(:position) }
  end

end
