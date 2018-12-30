# frozen_string_literal: true

require 'rails_helper'

# RSpec.describe "home page", :type => :request do
#   it "displays the user's username after successful login" do
#     user = User.create!(:username => "jdoe", :password => "secret")
#     get "/login"
#     assert_select "form.login" do
#       assert_select "input[name=?]", "username"
#       assert_select "input[name=?]", "password"
#       assert_select "input[type=?]", "submit"
#     end

#     post "/login", :username => "jdoe", :password => "secret"
#     assert_select ".header .username", :text => "jdoe"
#   end
# end

# url = 'https://everydayrails.com/2016/08/29/replace-rspec-controller-tests.html'

# describe "Public access to contacts", type: :request do
#   it "denies access to contacts#new" do
#     get new_contact_path
#     expect(response).to redirect_to login_url
#   end

#   it "denies access to contacts#create" do
#     contact_attributes = FactoryGirl.attributes_for(:contact)

#     expect {
#       post "/contacts", { contact: contact_attributes }
#     }.to_not change(Contact, :count)

#     expect(response).to redirect_to login_url
#   end
# end

# url = "https://relishapp.com/rspec/rspec-rails/docs/request-specs/request-spec"

# RSpec.describe "Widget management", :type => :request do

#   it "creates a Widget and redirects to the Widget's page" do
#     get "/widgets/new"
#     expect(response).to render_template(:new)

#     post "/widgets", :params => { :widget => {:name => "My Widget"} }

#     expect(response).to redirect_to(assigns(:widget))
#     follow_redirect!

#     expect(response).to render_template(:show)
#     expect(response.body).to include("Widget was successfully created.")
#   end

#   it "does not render a different template" do
#     get "/widgets/new"
#     expect(response).to_not render_template(:show)
#   end
# end

# # REQUEST JSON RESPONSE
# RSpec.describe "Widget management", :type => :request do

#   it "creates a Widget" do
#     headers = {
#       "ACCEPT" => "application/json",     # This is what Rails 4 accepts
#       "HTTP_ACCEPT" => "application/json" # This is what Rails 3 accepts
#     }
#     post "/widgets", :params => { :widget => {:name => "My Widget"} }, :headers => headers

#     expect(response.content_type).to eq("application/json")
#     expect(response).to have_http_status(:created)
#   end

# end

# # PROVIDE JSON DATA
# require "rails_helper"

# RSpec.describe "Widget management", :type => :request do

#   it "creates a Widget and redirects to the Widget's page" do
#     headers = { "CONTENT_TYPE" => "application/json" }
#     post "/widgets", :params => '{ "widget": { "name":"My Widget" } }', :headers => headers
#     expect(response).to redirect_to(assigns(:widget))
#   end

# end
