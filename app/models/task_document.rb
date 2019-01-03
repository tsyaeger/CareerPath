# frozen_string_literal: true

class TaskDocument < ApplicationRecord
  belongs_to :task
  belongs_to :document
end
