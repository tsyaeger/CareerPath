# frozen_string_literal: true

Rails.application.routes.draw do
  devise_for :users
  


  patch '/users/:id/jobs/:id/link_contact', to: 'jobs#link_contact', as: 'link_job_contact'
  patch '/users/:id/jobs/:id/link_document', to: 'jobs#link_document', as: 'link_job_document'

  delete '/users/:user_id/jobs/:job_id/contact/:contact_id/unlink', to: 'contacts#unlink_contact', as: 'unlink_job_contact'
  delete '/users/:user_id/jobs/:job_id/document/:document_id/unlink', to: 'documents#unlink_document', as: 'unlink_job_document'

  # get '/users/:id/jobs/:id/unlink_document', to: 'jobs#unlink_document', as: 'unlink_job_document'




  patch '/users/:id/tasks/:id/link_contact', to: 'tasks#link_contact', as: 'link_task_contact'
  patch '/users/:id/tasks/:id/link_document', to: 'tasks#link_document', as: 'link_task_document'
  patch '/users/:id/tasks/:id/add_job', to: 'tasks#add_job', as: 'add_task_job'

  delete '/users/:user_id/tasks/:task_id/contact/:contact_id/unlink', to: 'contacts#unlink_task_contact', as: 'unlink_task_contact'
  delete '/users/:user_id/tasks/:task_id/document/:document_id/unlink', to: 'documents#unlink_task_document', as: 'unlink_task_document'
  delete '/users/:user_id/tasks/:task_id/job/:job_id/unlink', to: 'jobs#unlink_task_job', as: 'unlink_task_job'



  get '/users/:id/contacts/:id/add_reference', to: 'contacts#add_reference', as: 'add_reference'
  get '/users/:id/jobs/:id/applied', to: 'jobs#applied', as: 'applied'
  get '/users/:id/tasks/:id/completed', to: 'tasks#completed', as: 'completed'

  get '/users/:id/jobs/:id/next', to: 'jobs#next', as: 'user_job_next'
  get '/users/:id/jobs/:id/previous', to: 'jobs#previous', as: 'user_job_previous'

  get '/users/:id/contacts/sort', to: 'contacts#sort', as: 'contacts_sort'

  get '/jobs/filter', to: 'jobs#filter', as: 'jobs_filter'
  get '/contacts/filter', to: 'contacts#filter', as: 'contacts_filter'
  get '/tasks/filter', to: 'tasks#filter', as: 'tasks_filter'
  get '/documents/filter', to: 'documents#filter', as: 'documents_filter'


  resources :users do
    resources :contacts
    resources :documents
    resources :jobs
    resources :tasks
  end

  root 'static_pages#home'

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
