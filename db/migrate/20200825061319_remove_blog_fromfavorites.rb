class RemoveBlogFromfavorites < ActiveRecord::Migration[5.2]
  def change
    remove_column :favorites, :blog, :integer
  end
end
