# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Task, type: :model do
  describe 'associations' do
    it { should have_many(:task_documents) }
    it { should have_many(:documents).through(:task_documents) }
    it { should have_many(:task_contacts) }
    it { should have_many(:contacts).through(:task_contacts) }
    it { should have_many(:task_job) }
    it { should have_many(:jobs).through(:task_jobs) }
    it { should belong_to(:user) }
  end

  describe 'validations' do
    it { should validate_presence_of(:title) }
  end

end
