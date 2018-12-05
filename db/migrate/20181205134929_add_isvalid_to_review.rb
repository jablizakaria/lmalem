class AddIsvalidToReview < ActiveRecord::Migration[5.2]
  def change
    add_column :reviews, :isvalid, :boolean
  end
end
