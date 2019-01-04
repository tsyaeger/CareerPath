# frozen_string_literal: true
module Tasks
  class ContactsController < ApplicationController
    skip_before_filter :verify_authenticity_token

    def unlink
      contact = Contact.find(params[:contact_id])
      task = Task.find(params[:job_id])
      task.contacts.delete(contact)
      respond_to do |format|
        format.json { render json: contact, status: 200 }
      end
    end
  end
end