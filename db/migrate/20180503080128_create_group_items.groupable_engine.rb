# This migration comes from groupable_engine (originally 20180215190118)
class CreateGroupItems < ActiveRecord::Migration[5.2]
  def change
    create_table :group_items do |t|
      t.references :group, foreign_key: true
      t.references :groupable, polymorphic: true

      t.timestamps
    end
  end
end
