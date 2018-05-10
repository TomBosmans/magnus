# This migration comes from groupable_engine (originally 20180215190003)
class CreateGroups < ActiveRecord::Migration[5.2]
  def change
    create_table :groups do |t|
      t.string :name
      t.string :description

      t.timestamps
    end
  end
end
