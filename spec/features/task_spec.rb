# frozen_string_literal: true

require 'rails_helper'

describe "tasks pages", type: :feature do
  before :each do    
    @user = User.create!(email: 'test@email.com', password: 'test1234', password_confirmation: 'test1234')
    @task = @user.tasks.create!(title: 'test title', description: 'test description')
    @user.tasks.create!(title: 'test 2 title', description: 'test 2 description')
    sign_in @user
  end

  it "displays the task title and description" do
    visit user_task_path(user_id: @user.id, id: @task.id)
    expect(page).to have_content 'test description'
    expect(page).to have_content 'test title'
  end

  it "displays all the tasks for the signed in user" do
    visit user_tasks_path(user_id: @user.id)    
    expect(page).to have_content 'test title'
    expect(page).to have_content 'test 2 title'
  end

end
