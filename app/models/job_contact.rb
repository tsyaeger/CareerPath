# frozen_string_literal: true

class JobContact < ApplicationRecord
  belongs_to :contact
  belongs_to :job
end
