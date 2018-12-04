class CreateUsersSpecialities < ActiveRecord::Migration[5.2]
  def change
    create_table :users_specialities do |t|
      t.text :description
      t.decimal :avg_punctuation

      t.decimal :avg_efficacy

      t.decimal :avg_behaviour

      t.references :user, foreign_key: true
      t.references :speciality, foreign_key: true

      t.timestamps
    end
  end
end
