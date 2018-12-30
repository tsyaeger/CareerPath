# frozen_string_literal: true

class JobsController < ApplicationController
  before_action :set_job, except: %i[index filter new create]

  def index
    @jobs = current_user.jobs
    respond_to do |format|
      format.html { render :index }
      format.json { render json: @jobs, status: 200 }
    end
  end

  def next
    @next_job = @job.next
    respond_to do |format|
      format.html { redirect_to(user_job_path(@next_job.user, @next_job)) }
      format.json { render json: @next_job }
    end
  end

  def previous
    @previous_job = @job.previous
    respond_to do |format|
      format.html { redirect_to(user_job_path(@previous_job.user, @previous_job)) }
      format.json { render json: @previous_job }
    end
  end

  def filter
    @filtered_jobs = current_user.jobs.filtered_job(params[:q])
    respond_to do |format|
      format.json { render json: { html: render_to_string('jobs/_filtered_jobs.html.erb', layout: false, locals: { filtered_jobs: @filtered_jobs }) } }
    end
  end

  def applied
    # binding.pry
    appStr = params[:q]
    appBool = appStr === 'true'

    @job.applied = appBool
    flash[:notice] = 'Applied status changed'
    @job.save
  end

  def add_contact
    c_id = params[:job][:contact_ids]
    contact = Contact.find(c_id)
    @job.contacts << contact unless @job.contacts.include?(contact)
    render json: contact, status: 201
  end

  def add_document
    d_id = params[:job][:document_ids]
    document = Document.find(d_id)
    @job.documents << document unless @job.documents.include?(document)
    render json: document, status: 201
  end

  # def unlink_contact
  #   binding.pry
  #   c_id = params[:q]
  #   contact = Contact.find(c_id)
  #   @job.contacts.delete(contact)
  #   respond_to do |format|
  #       format.json { render json: contact, status: 200 }
  #     end
  # end

  def unlink_document
    d_id = params[:q]
    document = Document.find(d_id)
    @job.documents.delete(document)
    respond_to do |format|
      format.json { render json: document, status: 200 }
    end
  end

  def new
    @job = Job.new(user: current_user)
    @user = current_user
  end

  def create
    @job = Job.create(job_params)
    @job.user = current_user
    @job.save
    redirect_to user_jobs_path(current_user)
  end

  def show
    respond_to do |format|
      format.html { render :show }
      format.json { render json: @job, status: 200 }
    end
  end

  def edit; end

  def update
    @job.update(job_params)
    flash[:notice] = 'Job updated'
    redirect_to user_job_path(@job.user, @job)
  end

  def destroy
    @job.destroy
    flash[:notice] = 'Job destroyed'
    redirect_to user_jobs_path(current_user)
  end

  private

  def job_params
    params.require(:job).permit(:company, :position, :date_posted, :job_desc, :co_desc, :url, :applied)
  end

  def set_job
    @job = Job.find(params[:id])
  end
end
