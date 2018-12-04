class UsersSpeciality < ApplicationRecord
  belongs_to :user
  belongs_to :speciality
  has_many :interventions
  has_many :reviews
end
