# frozen_string_literal: true
module Jobs
  class ContactsController < ApplicationController
    

    def unlink
      # binding.pry
      contact = Contact.find(params[:contact_id])
      job = Job.find(params[:job_id])
      job.contacts.delete(contact)
      respond_to do |format|
        format.json { render json: contact, status: 200 }
      end
    end
  end
end