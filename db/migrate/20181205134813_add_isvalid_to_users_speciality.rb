class AddIsvalidToUsersSpeciality < ActiveRecord::Migration[5.2]
  def change
    add_column :users_specialities, :isvalid, :boolean
  end
end
