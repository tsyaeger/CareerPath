# frozen_string_literal: true

require 'rails_helper'

describe "contacts pages", type: :feature do
  before :each do    
    @user = User.create!(email: 'test@email.com', password: 'test1234', password_confirmation: 'test1234')
    @job = @user.jobs.create!(company: 'test company', position: 'test position', job_desc: 'test desc')
    @contact = Contact.create!(email: 'test@email.com', first_name: 'test first name', last_name: 'test last name', user: @user)
    JobContact.create!(job: @job, contact: @contact)
    @user.jobs.create!(company: 'test 2 company', position: 'test 2 position', job_desc: 'test 2 desc')
    sign_in @user
  end

  it "displays the contact first and last name" do
    visit user_contact_path(user_id: @user.id, id: @contact.id)
    expect(page).to have_content 'test first name'
    expect(page).to have_content 'test last name'
  end

  it "displays all the contacts for the signed in user" do
    visit user_contacts_path(user_id: @user.id)    
    expect(page).to have_content 'test first name'
    expect(page).to have_content 'test last name'
  end

end
