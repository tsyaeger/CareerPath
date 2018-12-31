# frozen_string_literal: true

require 'rails_helper'

describe "the signin process", type: :feature do
  before :each do    
    @user = User.create!(email: 'test@email.com', password: 'test1234', password_confirmation: 'test1234')
    @job = @user.jobs.create!(company: 'test company', position: 'test position', job_desc: 'test desc')
    sign_in @user
  end

  it "displays the job content" do
    visit user_job_path(user_id: @user.id, id: @job.id)
    expect(page).to have_content 'test desc'
    expect(page).to have_content 'test company'
  end
end

