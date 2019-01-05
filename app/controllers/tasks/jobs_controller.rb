# frozen_string_literal: true
module Tasks
  class JobsController < ApplicationController
    

    def unlink
      @job = Job.find(params[:job_id])
      task = Task.find(params[:task_id])
      task.jobs.delete(@job)
      respond_to do |format|
        format.json { render json: @job, status: 200 }
      end
    end
  end
end

