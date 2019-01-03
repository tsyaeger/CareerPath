# frozen_string_literal: true
module Jobs
  class ContactsController < ApplicationController
    skip_before_action :verify_authenticity_token

    def unlink
      contact = Contact.find(params[:contact_id])
      job = Job.find(params[:job_id])
      job.contacts.delete(contact)
      respond_to do |format|
        format.json { render json: contact, status: 200 }
      end
    end
  end
end