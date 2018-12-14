class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
       :recoverable, :rememberable, :validatable

  has_many :users_specialities
  has_many :specialities, through: :users_specialities
  has_many :reviews
  has_many :interventions

  geocoded_by :address
  after_validation :geocode, if: :will_save_change_to_address?

  mount_uploader :photo, PhotoUploader

  after_initialize :init

  def init
    self.address ||= "Casablanca, Casablanca-Settat ⵜⵉⴳⵎⵉ ⵜⵓⵎⵍⵉⵍⵜ-ⵙⵟⵟⴰⵜ الدار البيضاء-سطات, Morocco" #let's you set a default association
  end

end
