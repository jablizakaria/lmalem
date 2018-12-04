class CreateReviews < ActiveRecord::Migration[5.2]
  def change
    create_table :reviews do |t|

      t.decimal :puntctuation

      t.decimal :efficacy

      t.decimal :behaviour

      t.text :commentary
      t.references :user, foreign_key: true
      t.references :users_speciality, foreign_key: true

      t.timestamps
    end
  end
end
