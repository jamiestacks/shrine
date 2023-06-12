class AddDescriptionToChapters < ActiveRecord::Migration[7.0]
  def change
    add_column :chapters, :description, :text
  end
end
