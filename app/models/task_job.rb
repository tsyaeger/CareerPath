# frozen_string_literal: true

class TaskJob < ApplicationRecord
  belongs_to :task
  belongs_to :job
end
