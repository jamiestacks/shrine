class RemoveNameFromShrines < ActiveRecord::Migration[7.0]
  def change
    remove_column :shrines, :name, :string
  end
end
