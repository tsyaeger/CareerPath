# frozen_string_literal: true

require 'rails_helper'

# RSpec.feature "visit and see the jobs for the signed in user" do
#   before do
#     user = FactoryGirl.create(:user)
#     sign_in_with(@user.email, '123456')
#   end

#   scenario "user can see his jobs" do
#     visit organization_invitations_path(@organization)

#     expect(current_path).to eq(organization_invitations_path(@organization))

#     expect(page).to have_content("Invite More Members")
#   end
# end



describe "the signin process", type: :feature do
  before :each do
    # User.make(email: 'user@example.com', password: 'password')
    @user = User.create!(username: 'test', password: 'test', email: 'test@email.com')
    @job = @user.jobs.create!(company: 'test company', position: 'test position', job_desc: 'test desc')
    # sign_in_with(@user.email, '123456')
  end

  it "displays the job content" do
    visit user_job_path(user_id: @user.id, id: @job.id)
    # within("#session") do
    #   fill_in 'Email', with: 'user@example.com'
    #   fill_in 'Password', with: 'password'
    # end
    # click_button 'Sign in'
    # save_and_open_page
    expect(page).to have_content 'test desc'
    expect(page).to have_content 'test company'
  end
end

