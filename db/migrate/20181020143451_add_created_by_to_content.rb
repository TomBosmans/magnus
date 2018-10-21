class AddCreatedByToContent < ActiveRecord::Migration[5.2]
  def change
    add_reference :contents, :creator, foreign_key: { to_table: :users }
  end
end
