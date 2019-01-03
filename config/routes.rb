# frozen_string_literal: true

Rails.application.routes.draw do
  devise_for :users
  


  # patch '/users/:user_id/jobs/:job_id/link_contact', to: 'jobs#link_contact', as: 'link_job_contact'
  # patch '/users/:user_id/jobs/:job_id/link_document', to: 'jobs#link_document', as: 'link_job_document'

  # delete '/users/:user_id/jobs/:job_id/contact/:contact_id/unlink', to: 'contacts#unlink_contact', as: 'unlink_job_contact'
  # delete '/users/:user_id/jobs/:job_id/document/:document_id/unlink', to: 'documents#unlink_document', as: 'unlink_job_document'

  # # get '/users/:id/jobs/:id/unlink_document', to: 'jobs#unlink_document', as: 'unlink_job_document'



  # patch '/users/:user_id/tasks/:task_id/link_contact', to: 'tasks#link_contact', as: 'link_task_contact'
  # patch '/users/:user_id/tasks/:task_id/link_document', to: 'tasks#link_document', as: 'link_task_document'
  # patch '/users/:user_id/tasks/:task_id/add_job', to: 'tasks#add_job', as: 'add_task_job'

  # delete '/users/:user_id/tasks/:task_id/contact/:contact_id/unlink', to: 'contacts#unlink_task_contact', as: 'unlink_task_contact'
  # delete '/users/:user_id/tasks/:task_id/document/:document_id/unlink', to: 'documents#unlink_task_document', as: 'unlink_task_document'
  # delete '/users/:user_id/tasks/:task_id/job/:job_id/unlink', to: 'jobs#unlink_task_job', as: 'unlink_task_job'



  # get '/users/:user_id/contacts/:contact_id/add_reference', to: 'contacts#add_reference', as: 'add_reference'
  # get '/users/:user_id/jobs/:job_id/applied', to: 'jobs#applied', as: 'applied'
  # get '/users/:user_id/tasks/:task_id/completed', to: 'tasks#completed', as: 'completed'

  # get '/users/:user_id/jobs/:job_id/next', to: 'jobs#next', as: 'user_job_next'
  # get '/users/:user_id/jobs/:job_id/previous', to: 'jobs#previous', as: 'user_job_previous'

  # get '/users/:user_id/contacts/sort', to: 'contacts#sort', as: 'contacts_sort'


  resources :users

  resources :tasks

  resources :contacts

  resources :documents

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

  root 'static_pages#home'

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
