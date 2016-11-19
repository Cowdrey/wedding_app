class Attendee < ApplicationRecord
  # Validations
  validates :email, presence: true
  validates :first_name, presence: true
  validates :last_name, presence: true
  validates :all_attendants, presence: true
  validates :party_count, presence: true, numericality: {
    only_integer: true, greater_than_or_equal_to: 1, less_than_or_equal_to: 100
  }
  validates :number_attending, presence: true, numericality: {
    only_integer: true, greater_than_or_equal_to: 0, less_than_or_equal_to: :party_count
  }
end
