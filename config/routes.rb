# frozen_string_literal: true

Rails.application.routes.draw do
  devise_for :users
  
  resources :users
  resources :contacts
  resources :documents
  resources :companies

  resources :jobs do
    patch :link_contact
    patch :link_document

    resources :contacts, module: 'jobs', only: [] do
      delete :unlink
    end

    resources :documents, module: 'jobs', only: [] do
      delete :unlink
    end
  end

  resources :tasks do
    patch :link_contact
    patch :link_document
    patch :link_job
    patch :link_company

    resources :contacts, module: 'tasks', only: [] do
      delete :unlink
    end

    resources :documents, module: 'tasks', only: [] do
      delete :unlink
    end    

    resources :jobs, module: 'tasks', only: [] do
      delete :unlink
    end

    resources :companies, module: 'tasks', only: [] do
      delete :unlink
    end
  end

  get '/contacts/:contact_id/add_reference', to: 'contacts#add_reference', as: 'add_reference'
  get '/contacts/sort', to: 'contacts#sort', as: 'contacts_sort'

  get '/jobs/:job_id/applied', to: 'jobs#applied', as: 'applied'
  get '/jobs/:job_id/archived', to: 'jobs#archived', as: 'archived'
  get '/jobs/:job_id/next', to: 'jobs#next', as: 'user_job_next'
  get '/jobs/:job_id/previous', to: 'jobs#previous', as: 'user_job_previous'
  
  get '/tasks/:task_id/completed', to: 'tasks#completed', as: 'completed'

  root 'static_pages#home'
end
