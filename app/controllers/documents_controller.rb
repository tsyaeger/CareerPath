# frozen_string_literal: true

class DocumentsController < ApplicationController
  before_action :set_document, only: %i[show edit update destroy]

  def index
    @document = Document.all
    respond_to do |format|
      format.html { render :index }
      format.json { render json: @document, status: 200 }
    end
  end


  def unlink_document
    binding.pry
    d_id = params[:document_id]
    j_id = params[:job_id]
    document = Document.find(d_id)
    job = Job.find(j_id)
    job.documents.delete(document)
    respond_to do |format|
         format.json { render json: document, status: 200 }
       end
  end


  def filter
    @filtered_documents = current_user.documents.filtered_document(params[:q])
    respond_to do |format|
      format.json { render json: { html: render_to_string('documents/_filtered_documents.html.erb', layout: false, locals: { filtered_documents: @filtered_documents }) } }
    end
  end

  def new
    @document = Document.new(user: current_user)
    @documents = current_user.documents
  end

  def create
    @document = Document.create(document_params)
    @document.user = current_user
    @document.save
    respond_to do |format|
      format.json { render json: { html: render_to_string('documents/_document.html.erb', layout: false, locals: { document: @document }) } }
    end
  end

  def show
    @document = Document.find_by(id: params[:id], user_id: current_user.id)
    respond_to do |format|
      format.html { render :show }
      format.json { render json: @document, status: 200 }
    end
  end

  def edit; end

  def update
    flash[:notice] = 'Document updated'
    @document.update(document_params)
    redirect_to user_document_path(@document.user, @document)
  end

  def destroy
    flash[:notice] = 'Document destroyed'
    @document.destroy
    redirect_to new_user_document_path(@document.user)
  end

  private

  def document_params
    params.require(:document).permit(:title, :url, :description, :doctype)
  end

  def set_document
    @document = Document.find(params[:id])
  end
end
