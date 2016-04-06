class CreatePoints < ActiveRecord::Migration
  def change
    create_table :points do |t|
      t.string :lat
      t.string :lng
      t.references :profile, index: true, foreign_key: true
    end
  end
end
