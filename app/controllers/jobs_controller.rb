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

  def applied
    appStr = params[:q]
    appBool = appStr === 'true'
    @job.applied = appBool
    flash[:notice] = 'Applied status changed'
    @job.save
    respond_to do |format|
      format.json { render json: @job }
    end
  end

  def link_contact
    # binding.pry
    c_id = params[:job][:contact_ids]
    @contact = Contact.find(c_id)
    @job.contacts << @contact unless @job.contacts.include?(@contact)
    respond_to do |format|
      format.json { render json: @contact }
    end
  end

  def link_document
    d_id = params[:job][:document_ids]
    @document = Document.find(d_id)
    @job.documents << @document unless @job.documents.include?(@document)
    respond_to do |format| 
      format.json { render json: @document }
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

  def edit 
  end

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
    params.require(:job).permit(:company, :position, :date_posted, :closing_date, :job_desc, :co_desc, :url, :applied, :requirements, :notes)
  end  

# INCLUDES ASSOC ITEMS
  # def job_params
  #   params.require(:job).permit(
  #     :company, :position, :date_posted, :closing_date, :job_desc, :co_desc, :url, :applied, :requirements, :notes, :contact_ids => [], :job_ids => [], :gif_ids => [])
  # end

  def set_job
    # binding.pry
    @job = Job.find(params[:id] || params[:job_id])
  end
end
