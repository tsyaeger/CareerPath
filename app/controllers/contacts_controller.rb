# frozen_string_literal: true

class ContactsController < ApplicationController
  before_action :set_contact, only: %i[show edit update destroy add_reference]
  skip_before_action :verify_authenticity_token

  def index
    @contacts = current_user.contacts
    respond_to do |format|
      format.html { render :index }
      format.json { render json: @contacts, status: 200 }
    end
  end

  def sort # THIS IS BEING READ AS A SHOW PAGE
    @contacts = current_user.contacts
    @contacts_sorted = @contacts.sort_by &:last_name
    respond_to do |format|
      format.json { render json: @contacts_sorted, status: 200 }
    end
  end

  def unlink_contact
    c_id = params[:contact_id]
    j_id = params[:job_id]
    contact = Contact.find(c_id)
    job = Job.find(j_id)
    job.contacts.delete(contact)
    # binding.pry
    respond_to do |format|
         format.json { render json: contact, status: 200 }
       end
  end

  def add_reference
    refStr = params[:q]
    refBool = refStr.to_s == 'true'
    @contact.reference = refBool
    flash[:notice] = 'Reference status has changed'
    @contact.save
    respond_to do |format|
      format.html { render :show }
      format.json { render json: @contact, status: 200 }
    end
  end

  def new
    @contact = Contact.new(user: current_user)
    @contacts = current_user.contacts
  end

  def create
    @contact = Contact.create(contact_params)
    @contact.user = current_user
    @contact.save

    respond_to do |format|
      format.json { render json: { html: render_to_string('contacts/_contact.html.erb', layout: false, locals: { contact: @contact }) } }
    end
  end

  def show
    respond_to do |format|
      format.html { render :show }
      format.json { render json: @contact, status: 200 }
    end
  end

  def edit 
  end

  def update
    flash[:notice] = 'Contact updated'
    @contact.update(contact_params)
    redirect_to user_contact_path(@contact.user, @contact)
  end

  def destroy
    flash[:notice] = 'Contact destroyed'
    @contact.destroy
    redirect_to new_user_contact_path(current_user)
  end

  private

  def contact_params
    params.require(:contact).permit(:first_name, :last_name, :workplace, :linkedin, :phone, :email, :reference)
  end

  def set_contact
    @contact = Contact.find(params[:id])
  end
end
