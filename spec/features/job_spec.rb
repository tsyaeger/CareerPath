# frozen_string_literal: true

require 'rails_helper'

describe "jobs pages", type: :feature do
  before :each do    
    @user = User.create!(email: 'test@email.com', password: 'test1234', password_confirmation: 'test1234')
    @job = @user.jobs.create!(company: 'test company', position: 'test position', job_desc: 'test desc')
    @contact = Contact.create!(email: 'test@email.com', first_name: 'test first name', last_name: 'test last name', user: @user)
    JobContact.create!(job: @job, contact: @contact)
    @user.jobs.create!(company: 'test 2 company', position: 'test 2 position', job_desc: 'test 2 desc')
    sign_in @user
  end

  it "displays the job content" do
    visit user_job_path(user_id: @user.id, id: @job.id)
    expect(page).to have_content 'test desc'
    expect(page).to have_content 'test company'
  end

  it "displays all the jobs for the signed in user" do
    visit user_jobs_path(user_id: @user.id)    
    expect(page).to have_content 'test company'
    expect(page).to have_content 'test 2 company'
  end

  it "displays the job content" do
    visit user_job_path(user_id: @user.id, id: @job.id)
    expect(page).to have_content 'test desc'
    expect(page).to have_content 'test company'
    # save_and_open_page
    expect(page).to have_content @contact.last_name
  end
end
