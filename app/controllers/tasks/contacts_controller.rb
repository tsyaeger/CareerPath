# frozen_string_literal: true
module Tasks
  class ContactsController < ApplicationController
    

    def unlink
      # binding.pry
      contact = Contact.find(params[:contact_id])
      task = Task.find(params[:task_id])
      task.contacts.delete(contact)
      respond_to do |format|
        format.json { render json: contact, status: 200 }
      end
    end
  end
end