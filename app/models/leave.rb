class Leave < ApplicationRecord
  scope :between, -> (start_date, end_date) { where('start_date >= ? and end_date <= ?', start_date, end_date) }
end
