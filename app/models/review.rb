class Review < ApplicationRecord
  belongs_to :user
  belongs_to :users_speciality
end
