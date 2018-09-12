class RemoveArtworkSharesIndex < ActiveRecord::Migration[5.1]
  def change
    remove_index :artwork_shares, :viewer_id
    add_index :artwork_shares, :viewer_id 
  end
end
