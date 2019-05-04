class CompanyContact < ApplicationRecord
  belongs_to :company
  belongs_to :contact
end
