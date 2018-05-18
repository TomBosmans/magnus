class CreateContents < ActiveRecord::Migration[5.2]
  def change
    create_table :contents do |t|
      t.string :name
      t.string :type

      t.jsonb :fields, null: false, default: {}
      t.jsonb :options, null: false, default: {}

      t.timestamps
    end
  end
end
