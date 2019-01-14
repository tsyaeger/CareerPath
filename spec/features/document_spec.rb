# frozen_string_literal: true

require 'rails_helper'

describe "documents pages", type: :feature do
  before :each do    
    @user = User.create!(email: 'test@email.com', password: 'test1234', password_confirmation: 'test1234')
    @document = @user.documents.create!(title: 'test title', description: 'test description')
    @user.documents.create!(title: 'test 2 title', description: 'test 2 description')
    sign_in @user
  end

  it "displays the document title and description" do
    visit user_document_path(user_id: @user.id, id: @document.id)
    expect(page).to have_content 'test description'
    expect(page).to have_content 'test title'
  end

  it "displays all the documents for the signed in user" do
    visit user_documents_path(user_id: @user.id)    
    expect(page).to have_content 'test title'
    expect(page).to have_content 'test 2 title'
  end

end
