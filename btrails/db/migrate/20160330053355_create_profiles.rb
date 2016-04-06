class CreateProfiles < ActiveRecord::Migration
  def change
    create_table :profiles do |t|
      t.integer :user_id
      t.string :username
      t.float :latest_point_lat
      t.float :latest_point_lng
      t.boolean :mapper

      t.timestamps null: false
    end
  end
end
