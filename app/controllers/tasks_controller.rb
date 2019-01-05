# frozen_string_literal: true

class TasksController < ApplicationController
  before_action :set_task, except: %i[index filter new create]

  def index
    @tasks = current_user.tasks
    @tasks_sorted = @tasks.sort_by &:date_due
    respond_to do |format|
      format.html { render :index }
      format.json { render json: @tasks_sorted, status: 200 }
    end
  end

  def new
    @task = Task.new(user: current_user)
    @tasks = current_user.tasks
  end

  def create
    @task = Task.create(task_params)
    @task.user = current_user
    @task.save
    respond_to do |format|
      format.html { redirect_to task_path(@task) }
      format.json { render json: @task, status: 200 }
    end
  end


  def show
    respond_to do |format|
      format.html { render :show }
      format.json { render json: @task, status: 200 }
    end
  end

  def completed
    completedStr = params[:q]
    completedBool = completedStr.to_s == 'true'
    @task.completed = completedBool
    @task.save
    flash[:notice] = 'Task status changed'
    respond_to do |format|
      format.html { render :show }
      format.json { render json: @task, status: 200 }
    end
  end





  def link_contact
    c_id = params[:task][:contact_ids]
    @contact = Contact.find(c_id)
    @task.contacts << @contact unless @task.contacts.include?(@contact)
    @task.save
    respond_to do |format|
      format.json { render json: @contact }
    end
  end

  def link_document
    d_id = params[:task][:document_ids]
    @document = Document.find(d_id)
    @task.documents << @document unless @task.documents.include?(@document)
    @task.save
    respond_to do |format|
      format.json { render json: @document }
    end
  end
    
  def link_job
    # binding.pry
    j_id = params[:task][:job_ids]
    @job = Job.find(j_id)
    @task.jobs << @job unless @task.jobs.include?(@job)
    if not @task.save
      respond_to do |format|
        format.json { render json: @job }
      end
    end
      
  end




  def edit
  end

  def update
    @task.update(task_params)
    flash[:notice] = 'Task updated'
    redirect_to task_path(@task)
  end

  def destroy
    @task.destroy
    flash[:notice] = 'Task destroyed'
    redirect_to new_task_path
  end

  private

  def task_params
    params.require(:task).permit(:title, :description, :doctype, :due_date, :completed)
  end

  def set_task
    @task = Task.find(params[:id] || params[:task_id])
  end
end
