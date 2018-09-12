class AddForeignKeyToResponses < ActiveRecord::Migration[5.1]
  def change
    add_column :responses, :user_id, :integer, null: false
  end
end
