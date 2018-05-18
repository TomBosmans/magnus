class CreateSettings < ActiveRecord::Migration[5.2]
  def change
    create_table :settings do |t|
      t.jsonb :application, null: false, default: {}
      t.timestamps
    end
  end
end
