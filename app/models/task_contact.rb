# frozen_string_literal: true

class TaskContact < ApplicationRecord
  belongs_to :task
  belongs_to :contact
end



