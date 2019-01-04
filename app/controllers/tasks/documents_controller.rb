# frozen_string_literal: true
module Tasks
  class DocumentsController < ApplicationController
    

    def unlink
      document = Document.find(params[:document_id])
      task = Task.find(params[:job_id])
      task.documents.delete(document)
      respond_to do |format|
        format.json { render json: document, status: 200 }
      end
    end
  end
end