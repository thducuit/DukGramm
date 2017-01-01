class AddIndexToTaggings < ActiveRecord::Migration
  def change
    add_index :taggings, [:tag_id, :photo_id], unique: true
  end
end
