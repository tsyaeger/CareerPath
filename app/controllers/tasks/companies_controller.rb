# frozen_string_literal: true
module Tasks
  class CompaniesController < ApplicationController
    def unlink
      # binding.pry
      companies = companies.find(params[:companies_id])
      task = Task.find(params[:task_id])
      task.companiess.delete(companies)
      respond_to do |format|
        format.json { render json: companies, status: 200 }
      end
    end
  end
end