class CreateAlbums < ActiveRecord::Migration[5.2]
  def change
    create_table :albums do |t|
      t.string :title, null: false
      t.integer :year, null: false
      t.string :type, null: false, default: 'studio'
      t.timestamps
    end
  end
end
