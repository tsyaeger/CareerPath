# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Document, type: :model do
  describe 'associations' do
    it { should have_many(:job_documents) }
    it { should have_many(:jobs).through(:job_documents) }
    it { should have_many(:task_documents) }
    it { should have_many(:tasks).through(:task_documents) }
    it { should belong_to(:user) }
  end

  describe 'validations' do
    it { should validate_presence_of(:title) }
  end

end
