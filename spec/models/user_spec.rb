# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Job, type: :model do
  describe 'associations' do
    it { should have_many(:documents) }
    it { should have_many(:contacts) }
    it { should have_many(:jobs) }
    it { should have_many(:tasks) }
  end

  describe 'validations' do
    it { should validate_presence_of(:username) }
    it { should validate_presence_of(:email) }
  end

end
