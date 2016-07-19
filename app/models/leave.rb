class Leave < ApplicationRecord
  scope :between, -> (start_date, end_date) { where('start_date >= ? and end_date <= ?', start_date, end_date) }

  def editable?(user)
    user_id == user.try(:id)
  end
end
