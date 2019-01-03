# frozen_string_literal: true
module Jobs
  class DocumentsController < ApplicationController
    skip_before_action :verify_authenticity_token

    def unlink
      document = Document.find(params[:document_id])
      job = Job.find(params[:job_id])
      job.documents.delete(document)
      respond_to do |format|
        format.json { render json: document, status: 200 }
      end
    end
  end
end