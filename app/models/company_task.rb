class CompanyTask < ApplicationRecord
  belongs_to :company
  belongs_to :task
end
