# frozen_string_literal: true

class CompaniesController < ApplicationController
  before_action :set_company, except: %i[index filter new create]

  def index
    @companys = current_user.companies
    respond_to do |format|
      format.html { render :index }
      format.json { render json: @companys, status: 200 }
    end
  end
  
  def show
    respond_to do |format|
      format.html { render :show }
      format.json { render json: @company, status: 200 }
    end
  end

  def next
  #   @next_company = @company.next
  #   respond_to do |format|
  #     format.html { redirect_to(company_path(@next_company)) }
  #     format.json { render json: @next_company }
  #   end
  end

  def previous
  #   @previous_company = @company.previous
  #   respond_to do |format|
  #     format.html { redirect_to(company_path(@previous_company)) }
  #     format.json { render json: @previous_company }
  #   end
  end

  def archived
    # appStr = params[:q]
    # appBool = appStr === 'true'
    # @job.archived = appBool
    # flash[:notice] = 'Archive status changed'
    # @job.save
    # respond_to do |format|
    #   format.json { render json: @job }
    # end
  end

  def link_contact
  #   c_id = params[:company][:contact_ids]
  #   @contact = Contact.find(c_id)
  #   @company.contacts << @contact unless @company.contacts.include?(@contact)
  #   @company.save
  #   respond_to do |format|
  #     format.json { render json: @contact }
  #   end
  end

  def link_document
  #   d_id = params[:company][:document_ids]
  #   @document = Document.find(d_id)
  #   @company.documents << @document unless @company.documents.include?(@document)
  #   @company.save
  #   respond_to do |format| 
  #     format.json { render json: @document }
  #   end
  end

  def new
    @company = Company.new(user: current_user)
    @user = current_user
  end

  def create
    binding.pry
    @company = Company.create(company_params)
    @company.user = current_user
    @company.save
    redirect_to company_path(@company)
  end


  def edit 
  end

  def update
    @company.update(company_params)
    flash[:notice] = 'company updated'
    redirect_to company_path(@company)
  end

  def destroy
    @company.destroy
    flash[:notice] = 'company destroyed'
    redirect_to companys_path
  end

  private

  def company_params
    params.require(:company).permit(:name, :description, :website, :notes)
  end  

  def set_company
    # binding.pry
    @company = Company.find(params[:id] || params[:company_id])
  end
end
