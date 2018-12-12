class Review < ApplicationRecord
  belongs_to :user
  belongs_to :users_speciality
  validates :puntctuation, :inclusion => 1..5
  validates :efficacy, :inclusion => 1..5
  validates :behaviour, :inclusion => 1..5
end
