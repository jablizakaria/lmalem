class CreateInterventions < ActiveRecord::Migration[5.2]
  def change
    create_table :interventions do |t|
      t.string :status
      t.date :date_intervention
      t.references :user, foreign_key: true
      t.references :users_speciality, foreign_key: true

      t.timestamps
    end
  end
end
