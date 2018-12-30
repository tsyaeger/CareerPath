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